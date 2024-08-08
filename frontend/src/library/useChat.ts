import { useState } from 'react';
import { Message } from "ai";
import { v4 as uuidv4 } from 'uuid';

export function useChat({ initialMessages = [], participantId }: { initialMessages: Message[], participantId: string }) {
    const [messages, setMessages] = useState<any[]>(initialMessages);
    const [input, setInput] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    const handleInputChange = (e: any) => setInput(e.target.value);

    const handleSubmit = async (e: any) => {
        e.preventDefault();
        if (input.trim() === '') return;

        setIsLoading(true);

        try {
            const response = await fetch('api/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ userQuery: input, participantId: participantId })
            })

            if (response.ok) {
                const res = JSON.parse(await response.json());
                const newUserMessage = { content: input, role: 'user', id: uuidv4().toString() }
                setMessages([...messages, newUserMessage]);
                const newAssistantMessage = { content: res.response, role: 'assistant', id: res.query_id };
                setMessages((prevMessages) => [...prevMessages, newAssistantMessage ])
            }
        } catch (error) {
            console.error('Error streaming response:', error);
        } finally {
            setIsLoading(false);
            setInput('');
        }
    };

    return { messages, input, handleInputChange, handleSubmit, isLoading };
}
