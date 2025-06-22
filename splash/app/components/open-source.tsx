import Image from 'next/image';
import { octokit } from '../lib/octokit';

export const OpenSource = async () => {
  // Fetch repository data
  const { data } = await octokit.repos.get({
    owner: 'zopiolabs',
    repo: 'zopio',
  });

  // Fetch contributors with proper typing
  const contributorsResponse = await octokit.repos.listContributors({
    owner: 'zopiolabs',
    repo: 'zopio',
    anon: 'true',
    per_page: 100,
  });

  // Ensure contributors is an array and filter out entries without avatar_url
  const contributors = Array.isArray(contributorsResponse.data)
    ? contributorsResponse.data.filter(
        (c) => c && typeof c === 'object' && c.avatar_url
      )
    : [];

  return (
    <div className="flex h-full flex-col items-start justify-between gap-4 p-8">
      <div className="flex flex-col gap-4">
        <div className="flex items-center gap-2 text-neutral-500">
          <small>Open source</small>
        </div>
        <p className="font-semibold text-xl tracking-tight">
          zopio currently has{' '}
          <span className="text-orange-600">{data.stargazers_count}</span>{' '}
          stars, <span className="text-orange-600">{data.forks_count}</span>{' '}
          forks, and{' '}
          <span className="text-orange-600">{data.open_issues_count}</span> open
          issues and{' '}
          <span className="text-orange-600">{contributors.length}</span>{' '}
          contributors.
        </p>
        <div className="-space-x-1 flex flex-row">
          {contributors.slice(0, 10).map((contributor) => (
            <Image
              key={String(contributor.id)}
              src={String(contributor.avatar_url)}
              alt={contributor.login ? String(contributor.login) : ''}
              width={28}
              height={28}
              className="rounded-full object-cover ring-2 ring-white"
            />
          ))}
        </div>
      </div>
      <a
        href="https://github.com/zopiolabs/zopio"
        className="inline-flex rounded-md border bg-white px-4 py-2 font-medium text-sm shadow-sm"
      >
        Browse the source code
      </a>
    </div>
  );
};
