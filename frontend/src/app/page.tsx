import Chat from "@/components/Chat";

export default function Home() {
  return (
      <div className="flex bg-gray-50 min-h-[calc(100dvh)] items-center justify-center">
        <div className="w-full max-w-screen-md max-h-screen bg-white shadow-lg rounded-lg p-6 mx-4">
            <Chat/>
        </div>
      </div>
  );
}
