export const runtime = "edge"

export async function POST(req: Request) {
    const { userQuery, participantId } = await req.json()
    const domain = process.env.CHATBOT_API_DOMAIN

    const url = `${domain}query?user_query=${userQuery}&participant_id=${participantId}`;
    return await fetch(url, {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
        }
    });
}
