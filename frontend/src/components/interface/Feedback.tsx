import React, { useState } from "react";
import { Modal, Box, Rating } from "@mui/material";
import { Button } from "@/components/interface/Button";
import { TextArea } from "@/components/interface/TextArea";
import { ChatTitle } from "@/components/interface/ChatAssets";

const styles = {
    modalBox: {
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        width: 400,
        bgcolor: 'background.paper',
        boxShadow: '0px 4px 20px rgba(0, 0, 0, 0.1)',
        p: 4,
        borderRadius: '12px',
    },
    rating: {
        marginBottom: '16px',
    },
    textArea: {
        width: '100%',
        marginBottom: '16px',
    }
};

export default function Feedback({ queryId }: { queryId: string }) {
    const [open, setOpen] = useState<boolean>(false);
    const [rating, setRating] = useState<number>(1);
    const [comment, setComment] = useState<string>("")

    const handleOpen = () => setOpen(true);
    const handleClose = () => setOpen(false);

    const handleSubmit = async () => {
        handleClose()
        await fetch('api/feedback', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                rating: rating,
                comment: comment,
                queryId: queryId
            })
        });
    }

    return (
        <div>
            <button
                className={`h-4 w-4 top-1/2 transition-all transform -translate-y-2 text-gray-500 dark:text-gray-400 hover:scale-125 cursor-pointer`}
                onClick={handleOpen}
            >
                ...
            </button>
            <Modal
                open={open}
                onClose={handleClose}
                aria-labelledby="feedback-modal-title"
                aria-describedby="feedback-modal-description"
            >
                <Box sx={styles.modalBox}>
                    <div className="flex flex-row items-start max-w-[100%] pb-4">
                        <ChatTitle className="text-2xl">Send Feedback</ChatTitle>
                    </div>
                    <Rating
                        name="simple-controlled"
                        value={rating}
                        onChange={(event, newValue) => {
                            setRating(newValue ?? 0);
                        }}
                        sx={styles.rating}
                    />
                    <TextArea
                        value={comment}
                        onChange={(e) => setComment(e.target.value)}
                        className={`pr-8 resize-none mendable-textarea min-h-[20px] h-32`}
                        placeholder="Type Written Feedback Here (Optional)"
                        style={styles.textArea}
                    />
                    <Button
                        onClick={handleSubmit}
                        disabled={rating < 1}
                    >
                        <div className="flex flex-col w-16">Send</div>
                    </Button>
                </Box>
            </Modal>
        </div>
    )
}
