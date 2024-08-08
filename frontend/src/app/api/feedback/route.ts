export const runtime = "edge"

export async function POST(req: Request) {
    const { rating, comment, queryId } = await req.json();
    const domain = process.env.CHATBOT_API_DOMAIN

    const url = `${domain}feedback?rating=${rating}&comment=${comment}&query_id=${Number(queryId)}`;
    return await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        }
    });
}
