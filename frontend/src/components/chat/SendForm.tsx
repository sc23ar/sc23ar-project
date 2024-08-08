import React, { useState, useRef, useEffect } from "react";
import { useEnsureRegeneratorRuntime } from "@/app/hooks/useEnsureRegeneratorRuntime";
import SpeechRecognition, { useSpeechRecognition } from "react-speech-recognition";
import { SpeechRecognition as SpeechRecognitionComponent } from "@/components/interface/SpeechRecognition"
import { TextArea } from "@/components/interface/TextArea";
import { Button } from "@/components/interface/Button";
import { Grid } from "react-loader-spinner";

interface SendForm {
    input: string;
    handleSubmit: (event: React.FormEvent<HTMLFormElement>) => void;
    isLoading: boolean;
    handleInputChange: (event: React.ChangeEvent<HTMLTextAreaElement>) => void;
}

export default function SendForm({
    input,
    handleSubmit,
    isLoading,
    handleInputChange
}: SendForm) {
    useEnsureRegeneratorRuntime();

    const [textAreaHeight, setTextAreaHeight] = useState("h-10");
    const textAreaRef = useRef(null);

    const { listening, browserSupportsSpeechRecognition, resetTranscript, transcript } = useSpeechRecognition();

    useEffect(() => {
        if (!browserSupportsSpeechRecognition) {
            console.log('Browser does not support speech recognition')
        } else {
            console.log('Browser supports speech recognition')
        }
    }, [browserSupportsSpeechRecognition]);

    useEffect(() => {
        const textArea = document.querySelector("textarea");
        if (textArea) {
            if (input === "") {
                resetTranscript();
                setTextAreaHeight("h-10");
            } else {
                const shouldExpand =
                    textArea.scrollHeight > textArea.clientHeight &&
                    textAreaHeight !== "h-20";
                if (shouldExpand) {
                    setTextAreaHeight("h-20");
                }
            }

            if (listening) {
                textArea.scrollTop = textArea.scrollHeight;
            }
        }
    }, [listening, input, textAreaHeight]);

    useEffect(() => {
        const handleVisibilityChange = () => {
            if (document.visibilityState === "hidden" && listening) {
                void SpeechRecognition.stopListening();
            }
        };

        document.addEventListener("visibilitychange", handleVisibilityChange);

        return () => {
            document.removeEventListener("visibilitychange", handleVisibilityChange);
        };
    }, [listening]);

    useEffect(() => {
        if (transcript) {
            updateInputWithTranscript(transcript);
        }
    }, [transcript]);

    const updateInputWithTranscript = (transcriptValue: string) => {
        const event: any = {
            target: { value: transcriptValue },
        };
        handleInputChange(event);
    };

    function toggleSpeech() {
        if (listening) {
            void SpeechRecognition.stopListening();
            return;
        } else {
            void SpeechRecognition.startListening({ continuous: true });
            return;
        }
    }

    return (
        <form
            onSubmit={(event) => {
                handleSubmit(event)
            }}
            className="flex items-center justify-center w-full space-x-2"
        >
            <div className="relative w-full max-w-xs">
                <SpeechRecognitionComponent
                    onClick={toggleSpeech}
                    className={`absolute right-2 h-4 w-4 top-1/2 transition-all transform -translate-y-2 ${
                        listening ? "text-red-500 scale-125 animate-pulse" : "text-gray-500"
                    } dark:text-gray-400 hover:scale-125 cursor-pointer`}
                />
                <TextArea
                    value={input}
                    onChange={handleInputChange}
                    className={`pr-8 resize-none mendable-textarea min-h-[20px] ${textAreaHeight}`}
                    placeholder="Type your question..."
                    ref={textAreaRef}
                />
            </div>

            <Button className="h-10">
                {isLoading ? (
                    <div className="flex gap-2 items-center">
                        <Grid
                            height={12}
                            width={12}
                            radius={5}
                            ariaLabel="grid-loading"
                            color="#fff"
                            visible={true}
                        />
                            {"Please wait..."}
                        </div>
                ) : (
                    <div className="flex flex-col w-16">Send</div>
                )}
            </Button>
        </form>
)}
