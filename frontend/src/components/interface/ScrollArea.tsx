"use client"
import { forwardRef, ElementRef, ComponentPropsWithoutRef } from "react";
import { ScrollAreaScrollbar, ScrollAreaThumb, Root, Viewport, Corner } from "@radix-ui/react-scroll-area";
import { cn } from "@/library/utilities";

const ScrollBar = forwardRef<
    ElementRef<typeof ScrollAreaScrollbar>,
    ComponentPropsWithoutRef<typeof ScrollAreaScrollbar>
>(({className, orientation = "vertical", ...props }, ref) => (
    <ScrollAreaScrollbar
        ref={ref}
        orientation={orientation}
        className={cn(
            "flex touch-none select-none transition-colors",
            orientation === "vertical" &&
            "h-full w-2.5 border-l border-l-transparent p-[1px]",
            orientation === "horizontal" &&
            "h-2.5 border-t border-t-transparent p-[1px]",
            className
        )}
        {...props}
    >
        <ScrollAreaThumb className="relative flex-1 rounded-full bg-border" />
    </ScrollAreaScrollbar>
));

export const ScrollArea = forwardRef<
    ElementRef<typeof Root>,
    ComponentPropsWithoutRef<typeof Root>
>(({ className, children, ...props }, ref) => (
    <Root
        className={cn("relative overflow-hidden", className)}
        {...props}
    >
        <Viewport ref={ref} className="h-full w-full rounded-[inherit]">
            {children}
        </Viewport>
        <ScrollBar />
        <Corner />
    </Root>
));

ScrollBar.displayName = "ScrollBar";
ScrollArea.displayName = "ScrollArea";
