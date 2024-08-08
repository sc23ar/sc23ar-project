"use client"
import { ComponentPropsWithoutRef, ElementRef, forwardRef } from "react";
import { Root, Image } from "@radix-ui/react-avatar";
import { cn } from "@/library/utilities"

export const Avatar = forwardRef<
    ElementRef<typeof Root>,
    ComponentPropsWithoutRef<typeof Root>
>(({ className, ...props }, ref) => (
    <Root
        ref={ref}
        className={cn(
            "relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full",
            className
        )}
        {...props}
    />
))

const AvatarImage = forwardRef<
    ElementRef<typeof Image>,
    ComponentPropsWithoutRef<typeof Image>
>(({ className, ...props }, ref) => (
    <Image
        ref={ref}
        className={cn("aspect-square h-full w-full", className)}
        {...props}
    />
))

Avatar.displayName = Root.displayName;
AvatarImage.displayName = Image.displayName;

