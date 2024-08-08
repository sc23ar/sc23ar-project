"use client"
import { useEnsureRegeneratorRuntime } from "@/app/hooks/useEnsureRegeneratorRuntime";
import { useChat } from "@/library/useChat";
import { useRef, useEffect } from "react";
import { v4 as uuidv4 } from 'uuid';
import { ChatHeader, ChatTitle, ChatContent, ChatFooter } from "@/components/interface/ChatAssets";
import { ScrollArea } from "@/components/interface/ScrollArea";
import Message from "@/components/chat/Message";
import SendForm from "@/components/chat/SendForm";


export default function Chat() {
   const { messages, input, handleInputChange, handleSubmit, isLoading } =
       useChat({
         initialMessages: [],
         participantId: uuidv4().toString(),
      })

   useEnsureRegeneratorRuntime();

   const scrollAreaRef = useRef<null | HTMLDivElement>(null);

   useEffect(() => {
      if (scrollAreaRef.current) {
         scrollAreaRef.current.scrollTo({
            top: scrollAreaRef.current.scrollHeight,
            behavior: "smooth",
         });
      }
   }, [messages]);

   return (
       <div>
          <ChatHeader>
             <div className="flex flex-row items-start justify-between max-w-[100%]">
                <ChatTitle className="text-lg">Immigration Adviser Chatbot</ChatTitle>
             </div>
          </ChatHeader>
          <ChatContent>
            <ScrollArea
                ref={scrollAreaRef}
                className="h-[450px] overflow-y-auto w-full spacy-y-4 pr-4"
            >
                <Message
                    message={{
                        role: "assistant",
                        content: "Ask me a question about immigration rules",
                        id: "initialai",
                    }}
                />
                {messages.map((message) => (
                    <Message key={message.id} message={message} />
                ))}
            </ScrollArea>
          </ChatContent>
          <ChatFooter>
              <SendForm
                  input={input}
                  handleSubmit={handleSubmit}
                  isLoading={isLoading}
                  handleInputChange={handleInputChange}
              />
          </ChatFooter>
       </div>
   )
}
