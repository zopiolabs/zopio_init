'use client';

import { toast } from 'sonner';

const command = 'npx zopio@latest init';

export const Installer = () => {
  const handleCopy = () => {
    navigator.clipboard.writeText(command);
    toast.success('Copied to clipboard');
  };

  return (
    <div className="flex h-10 w-full items-center justify-center gap-2 whitespace-nowrap rounded-md border bg-white px-4 py-2 text-neutral-950 text-sm shadow-sm dark:bg-neutral-950 dark:text-white">
      <p className="pointer-events-none shrink-0 select-none text-neutral-500 dark:text-neutral-400">
        $
      </p>
      <div className="flex-1 truncate text-left font-mono">{command}</div>
      <div className="flex shrink-0 items-center gap-2">
        <button type="button" aria-label="Copy" onClick={handleCopy}></button>
      </div>
    </div>
  );
};
