import React from "react";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Immigration Chatbot Adviser",
  description: "An experimental chatbot to ask questions about British immigration rules",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    </head>
    <body className={inter.className}>
      {children}
    </body>
    </html>
  );
}
