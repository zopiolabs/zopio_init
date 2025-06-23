# 2.0.0 (2025-06-23)


### Bug Fixes

*  updated the Stripe API version in the payments package from '2025-04-30.basil' to '2025-05-28.basil' to fix the type error that was causing the build to fail. ([cbc0dec](https://github.com/zopiolabs/zopio_init/commit/cbc0dec480eb57340df7d3adde84060e3ca76917))
* adding proper error handling and fallbacks for data.blog.posts ([3f95bd4](https://github.com/zopiolabs/zopio_init/commit/3f95bd432080aa6b6afa9a86bf34d176cf49e354))
* app component with grid layout and app preview cards ([25af794](https://github.com/zopiolabs/zopio_init/commit/25af79406e53d95afcd8ee3a0eebaf86714540da))
* auth-hooks package with useAccess hook and dependencies for new react version ([b44f7ec](https://github.com/zopiolabs/zopio_init/commit/b44f7ec49d722da17cf07ad6b0ba0c939fcbe144))
* Check for Vercel environment using process.env instead of env object ([c1681dc](https://github.com/zopiolabs/zopio_init/commit/c1681dc381743dee8437d3683b827cd5cacc8ab5))
* **ci:** add missing configuration files for spell checker and link checker ([87ebd9a](https://github.com/zopiolabs/zopio_init/commit/87ebd9aae20f3e93f881b58280213ab6e47386f3)), closes [#41](https://github.com/zopiolabs/zopio_init/issues/41)
* **ci:** add staging branch to CI and CodeQL workflows ([29db940](https://github.com/zopiolabs/zopio_init/commit/29db94035b9ff1ab6273179c14400a4a543a024c))
* **ci:** add staging branch to CI and CodeQL workflows ([#13](https://github.com/zopiolabs/zopio_init/issues/13)) ([e1a77b7](https://github.com/zopiolabs/zopio_init/commit/e1a77b71c90640f6053354f90a4564630f46f8e6))
* **ci:** align security workflow with git flow specifications ([95d2f76](https://github.com/zopiolabs/zopio_init/commit/95d2f76c72d7caab1e21d1b363f27907bdfac79d))
* **ci:** improve PR labeling workflow with breaking change support and debugging ([#94](https://github.com/zopiolabs/zopio_init/issues/94)) ([c15fe29](https://github.com/zopiolabs/zopio_init/commit/c15fe296c70aa9e286aca4a401b374e895382d68))
* **ci:** remove failing License Compliance Check from security workflow ([#95](https://github.com/zopiolabs/zopio_init/issues/95)) ([f175708](https://github.com/zopiolabs/zopio_init/commit/f1757086a696e02d13075efaa19682c417913ba3))
* **ci:** remove inline comments from semantic PR validation config ([9997f9b](https://github.com/zopiolabs/zopio_init/commit/9997f9bc82cf9662e23d0ec5d03b3b20338e6465))
* **ci:** remove invalid generateSarif parameter from Semgrep action ([82fafcd](https://github.com/zopiolabs/zopio_init/commit/82fafcdc15e300aa830aab1c99a93d44ea9bebe7))
* **ci:** resolve release workflow failure by fixing pnpm installation order ([f348158](https://github.com/zopiolabs/zopio_init/commit/f348158d80fdad947d911e7f3a8345efcd70e5b8))
* **ci:** update labeler configuration to v5 syntax ([862fd9c](https://github.com/zopiolabs/zopio_init/commit/862fd9cefffa96a4dcd2943f6fd40d7bad3bd5ec)), closes [#41](https://github.com/zopiolabs/zopio_init/issues/41)
* **docs:** correct markdown rendering issues in workflow documentation ([d750b84](https://github.com/zopiolabs/zopio_init/commit/d750b84af67424beb4c76b928b94b85cc2885ecd))
* **docs:** correct repository references and add clarifications ([7b34ffd](https://github.com/zopiolabs/zopio_init/commit/7b34ffd2f7976b71cee483e3cba1b44c7263bc48))
* Feed child function type in hero.tsx to resolve build error ([5d7d91f](https://github.com/zopiolabs/zopio_init/commit/5d7d91f50ac40f856b1067bd86c1aa6c97f084c9))
* Fixed the console logging warnings by replacing: ([4989852](https://github.com/zopiolabs/zopio_init/commit/4989852396256a440385aef9a58b3d9fc06c67a1))
* health check endpoint ([4e5c5ae](https://github.com/zopiolabs/zopio_init/commit/4e5c5ae697849c675ce2a5e02a5b24964796095f))
* icons removed because of import errors ([b6999f2](https://github.com/zopiolabs/zopio_init/commit/b6999f25c49123ae0c542d98eeaf85c7f3a3a206))
* icons removed from tsx pages ([0c47cd0](https://github.com/zopiolabs/zopio_init/commit/0c47cd0521d20024c738eb3679cc40a4c1905bb3))
* implement trigger webhook endpoint and job definitions structure ([5a59d0f](https://github.com/zopiolabs/zopio_init/commit/5a59d0ff73f72964f6844a2573b69ceedd89a9ef))
* implement webhook endpoint for handling Trigger.dev events ([3a28770](https://github.com/zopiolabs/zopio_init/commit/3a287705f8f76b8e6869a76ef8d66bc3234636df))
* implementing health check endpoint with HTML status page and plain text response ([b6ac552](https://github.com/zopiolabs/zopio_init/commit/b6ac5523ff7f9bb170a32bebdaa6a18306904d2b))
* issue[#11](https://github.com/zopiolabs/zopio_init/issues/11) - When running "pnpm dev", the build fails for some packages due to missing scripts/index.ts file ([e591858](https://github.com/zopiolabs/zopio_init/commit/e591858f911ad3651d36687213153fde3e63d157))
* lucide-react icon imports for Vercel build ([62467ce](https://github.com/zopiolabs/zopio_init/commit/62467ce64ad79aea5cefe9b71b74f1b911675797))
* no need a plain healt.test anymore ([cd4dc40](https://github.com/zopiolabs/zopio_init/commit/cd4dc40b7c8824feb1654faeb77c16910b288578))
* other icons removed ([06fac47](https://github.com/zopiolabs/zopio_init/commit/06fac47a94a32ea1f5777f78b5fa851924b672fc))
* refactor CLI with init and update commands using Commander.js ([9204ca0](https://github.com/zopiolabs/zopio_init/commit/9204ca0ff0241eb3acc0941ace06afde89bb91fb))
* remove async children from Feed component to fix build error ([3be7869](https://github.com/zopiolabs/zopio_init/commit/3be78694d478f6f71fea73e2f5a87a084355caac))
* remove redundant pnpm caching in security workflow ([#104](https://github.com/zopiolabs/zopio_init/issues/104)) ([7ff9902](https://github.com/zopiolabs/zopio_init/commit/7ff9902ce10454f98101692f5c7d8f539eeaf50a))
* robots.txt configuration with sitemap URL and allow rules ([229c7dd](https://github.com/zopiolabs/zopio_init/commit/229c7ddf8c2e788d0aaa4505484097673cfda730))
* simplify docs workflow by removing LICENSE requirement and linting ([6daa172](https://github.com/zopiolabs/zopio_init/commit/6daa172be3e3b23b371aeaef73aec421d8cc71f9))
* solved depends version and deployment errors ([6f0fe44](https://github.com/zopiolabs/zopio_init/commit/6f0fe4403816000e59efdf69d10e9d6261bcc4c8))
* test release workflow trigger ([#98](https://github.com/zopiolabs/zopio_init/issues/98)) ([7636b80](https://github.com/zopiolabs/zopio_init/commit/7636b80c7c7e7386d58648a55253eeee9096fab1))
* Turkish language dictionary file ([968b262](https://github.com/zopiolabs/zopio_init/commit/968b2626fc43e1339c1fbd740dca7113e63d66f5))
* TypeScript errors in blog and legal pages by adding proper null checks and type assertions. ([bb49940](https://github.com/zopiolabs/zopio_init/commit/bb4994042bd4e06e9370fa83786b9916ec9ae193))
* update app component to display grid of app templates with icons and descriptions ([b63ec04](https://github.com/zopiolabs/zopio_init/commit/b63ec0479d0920610347236a48c218ede1f74117))
* update domain from zopio.io to zopio.dev ([#15](https://github.com/zopiolabs/zopio_init/issues/15)) ([120e91a](https://github.com/zopiolabs/zopio_init/commit/120e91aa6317e119c8ece059156d0163a07103da))
* update splash page with app showcase grid and project dependencies ([291ca94](https://github.com/zopiolabs/zopio_init/commit/291ca94f4ac435809ffcee9a893764b668a97edc))
* update splash page with app showcase grid and project dependencies ([ef33f13](https://github.com/zopiolabs/zopio_init/commit/ef33f1377e584d279d7e568f11a3ca5976d6fb4c))
* Updated Feed component usage across blog components ([3188f64](https://github.com/zopiolabs/zopio_init/commit/3188f64b3f7854b79bb752c9b89fe7e43b75754f))
* Updated Feed component usage across blog components and footer ([15f26a7](https://github.com/zopiolabs/zopio_init/commit/15f26a7e3d3a9eea4ad991b9131b4020eb49546b))
* Updated Feed component usage and resolved type errors [skip ci] ([819c642](https://github.com/zopiolabs/zopio_init/commit/819c642e9631283e1855bb6c9b0c8cbcbd2dd773))
* webhook endpoint for processing Trigger.dev events ([cc2a5fa](https://github.com/zopiolabs/zopio_init/commit/cc2a5fabe9c231e15fa5fd3ccb61f34fbe6d6161))


### Code Refactoring

* **ci:** optimize GitHub workflows to reduce redundancy and improve efficiency ([39f5c58](https://github.com/zopiolabs/zopio_init/commit/39f5c584207c5306985bc4fab27241c62b3fa8f4))


### Features

* add CLI scripts for project initialization and version updates ([b2699dd](https://github.com/zopiolabs/zopio_init/commit/b2699dd4f2fd698ff83ddff01e2ff098d7ee620d))
* Add CODEOWNERS file for code review requirements ([e4dcb82](https://github.com/zopiolabs/zopio_init/commit/e4dcb8296cadb304f341f9d730b4d623d259bffe))
* Add comprehensive security and workflow configurations ([c53c595](https://github.com/zopiolabs/zopio_init/commit/c53c595e86c6d577348dd59eade5c250822af79f))
* add DevOps implementation task issue template ([9c4912d](https://github.com/zopiolabs/zopio_init/commit/9c4912d0223f2ec53118a8c51725d6da876a9675))
* add health check endpoint with HTML status page ([e4148c2](https://github.com/zopiolabs/zopio_init/commit/e4148c23acb3174b2b47dd7b2fc33cb47e3c9530))
* add SEO package with metadata generation and JSON-LD support ([fc1bf77](https://github.com/zopiolabs/zopio_init/commit/fc1bf77a4130d4804ed03678af6d5689c047a6a5))
* add shared TypeScript configurations for Next.js, React library, and base settings ([ce2a016](https://github.com/zopiolabs/zopio_init/commit/ce2a01648a1fa9ec3ebc3b308177718770b8db86))
* add testing package with Vitest and React configuration ([7b669aa](https://github.com/zopiolabs/zopio_init/commit/7b669aab6baf57b81ee151dfa77d20dab707f122))
* add trigger.dev integration package with event sending functionality ([04aca35](https://github.com/zopiolabs/zopio_init/commit/04aca35624b34295c4a358cfd4704c724a496a77))
* add turbo generator for creating new packages with standardized configs ([9a58935](https://github.com/zopiolabs/zopio_init/commit/9a58935826bb792d2bc55df6f29842cc97a125ab))
* **ci:** Enhanced Branch Protection - Phase 1 ([#16](https://github.com/zopiolabs/zopio_init/issues/16)) ([968e14f](https://github.com/zopiolabs/zopio_init/commit/968e14fd5ab7c85b5fd325531d07636a962b8786))
* **ci:** update GitHub workflows and add documentation workflow ([6a2a190](https://github.com/zopiolabs/zopio_init/commit/6a2a1900cefa638109abc6ea0dfbb8b793dcfd64))
* **community:** add comprehensive community-first enhancements ([#14](https://github.com/zopiolabs/zopio_init/issues/14)) ([841935b](https://github.com/zopiolabs/zopio_init/commit/841935b52719fcf550b4b91d2d3d05de21ccf3a2))
* create AI package with OpenAI integration and chat UI components ([ea398ba](https://github.com/zopiolabs/zopio_init/commit/ea398bade09c9f4bfeb035ea9460f922928ab008))
* create auth package with Clerk integration and API key middleware ([2cd6ffe](https://github.com/zopiolabs/zopio_init/commit/2cd6ffe5f6afc8a73fa8a6d9f8adac9093b68751))
* create auth-hooks package with useAccess hook for RBAC permissions ([ee45d1c](https://github.com/zopiolabs/zopio_init/commit/ee45d1c055cf263e01d0cbb09d6ef269e4040a71))
* create auth-runner package to combine RBAC and ABAC rules with logging ([9e72d29](https://github.com/zopiolabs/zopio_init/commit/9e72d2907e9398b8e49f9b1afc8d6428ee3c0095))
* create CMS package with BaseHub integration and components ([9737b1a](https://github.com/zopiolabs/zopio_init/commit/9737b1a52786f4389dbd9ddbaf067fb9fe9672c7))
* create CRUD package with UI components, hooks and engine ([c1bbd98](https://github.com/zopiolabs/zopio_init/commit/c1bbd98239145a207c44a331fad025083b3fc036))
* create email package with contact template and Resend integration ([6a04ba6](https://github.com/zopiolabs/zopio_init/commit/6a04ba6cbbf8dee11c3ec717663a5a4aed104289))
* create next-config package with shared Next.js configuration and environment setup ([2feef3b](https://github.com/zopiolabs/zopio_init/commit/2feef3b886073c84751f978375576d739dae68ce))
* create observability package with Sentry, BetterStack and Logtail integration ([006d843](https://github.com/zopiolabs/zopio_init/commit/006d843a4c9992f6e5f3f72c086b49cc3f51bb72))
* create official splash landing page for zopio framework ([6d11368](https://github.com/zopiolabs/zopio_init/commit/6d113681f2c14e4c6cac5f31191cfd059a82e484))
* create security package with Arcjet and Nosecone integrations for bot detection and security headers ([450b921](https://github.com/zopiolabs/zopio_init/commit/450b921f06ebe00b29422d62b290cc5c885bfbd6))
* create storage package with Vercel Blob integration and env config ([6bcfda3](https://github.com/zopiolabs/zopio_init/commit/6bcfda3d331d9c893bcaa6759a77ff55bab22dc7))
* create view builder package with drag-and-drop canvas, toolbox, and JSON editor components ([f2d3c74](https://github.com/zopiolabs/zopio_init/commit/f2d3c74e0f095e61687e7211c31d8ec117120a3d))
* create view package with schema validation and rendering components ([6bee9b3](https://github.com/zopiolabs/zopio_init/commit/6bee9b31407ac081fbefb654f4b335bb1894f2db))
* implement analytics package with PostHog, Google Analytics, and Vercel integrations ([084c53c](https://github.com/zopiolabs/zopio_init/commit/084c53c24fc350e727ae017d05961df36c96d51f))
* implement attribute-based access control (ABAC) rules package for region and clearance level checks ([e42caf6](https://github.com/zopiolabs/zopio_init/commit/e42caf644db725313b49cd8a9021e484b9aa061a))
* implement auth logging system with console, file and BetterStack adapters ([7c5d4a7](https://github.com/zopiolabs/zopio_init/commit/7c5d4a7d3352233d8ed6a56c4fe164c68d6f9316))
* implement Clerk API key management package with create and validate functions ([a5f54f7](https://github.com/zopiolabs/zopio_init/commit/a5f54f7ad2be9242244df825850747282089e7ce))
* implement dynamic sitemap generation for web app pages and content ([662e334](https://github.com/zopiolabs/zopio_init/commit/662e334075b1fdea9a04dd345f8467c30436a754))
* implement feature flags package with Vercel Toolbar integration ([24dbe17](https://github.com/zopiolabs/zopio_init/commit/24dbe17f6026f94256a3eaefcbfd0bd55801eac8))
* implement Liveblocks collaboration package with auth, room management and config ([5444c63](https://github.com/zopiolabs/zopio_init/commit/5444c63ed576a2ace895ea55da63cf9e15426adf))
* implement notifications package with Knock integration and UI components ([78125f4](https://github.com/zopiolabs/zopio_init/commit/78125f4f14a6a3649210740ff8ab314e2e81a30f))
* implement rate limiting package with Upstash Redis integration ([5470673](https://github.com/zopiolabs/zopio_init/commit/5470673d166f3636bbbe0095753f7c90d0ec729d))
* implement RBAC authorization system with rules engine and middleware ([73bab2e](https://github.com/zopiolabs/zopio_init/commit/73bab2ecff58e867214a5da030f0cbc34560df23))
* implement trigger rules engine with JSON-based rule evaluation and actions ([4a5169c](https://github.com/zopiolabs/zopio_init/commit/4a5169ca6a7bca23cc8e142343251c5a1fb81fe1))
* implement webhook package with Svix integration for event notifications ([17fe2f3](https://github.com/zopiolabs/zopio_init/commit/17fe2f3d6c035e028a15c1356e3efe7b9b24b0ff))
* initialize CLI project with CRUD command structure and templates ([6b49b7c](https://github.com/zopiolabs/zopio_init/commit/6b49b7c56a801170cb18ec92e5d6db06e9f02498))
* initialize data package with providers and adapters ([e13150a](https://github.com/zopiolabs/zopio_init/commit/e13150abacfa1e5de766e8663a5b8d82bf6a48f2))
* initialize database package with Prisma client and schema ([11edb52](https://github.com/zopiolabs/zopio_init/commit/11edb52af4390f2f2029a06a80cac10e09d0e267))
* initialize design system package with UI components and theme ([c10ee34](https://github.com/zopiolabs/zopio_init/commit/c10ee34eb97b4fcbbfc6ffd1211aeb4f5549fab4))
* initialize documentation site with Mintlify setup and content ([d366be9](https://github.com/zopiolabs/zopio_init/commit/d366be931a1092aeca48ceec1da6a12c75b60ade))
* initialize email app with contact template preview ([5d7a971](https://github.com/zopiolabs/zopio_init/commit/5d7a971b3fc0add09825632f3298e49e0f984000))
* initialize internationalization package with multi-language support and translation infrastructure ([e9eeb77](https://github.com/zopiolabs/zopio_init/commit/e9eeb772f64e8d5da4bee02ebe57a6f603f5ddef))
* initialize Next.js API app with health, webhooks and trigger routes ([80b51ac](https://github.com/zopiolabs/zopio_init/commit/80b51ac74a8b5675aed9a16c7cf598eb10adf48c))
* initialize payments package with Stripe integration and agent toolkit ([d8ff723](https://github.com/zopiolabs/zopio_init/commit/d8ff723a7817b0fdac412fd877bc865d7a83248b))
* initialize prisma studio app ([e75769f](https://github.com/zopiolabs/zopio_init/commit/e75769fea419f4b1fda18cc2a9a8fd89e64c2349))
* initialize storybook app with UI component stories ([11315c2](https://github.com/zopiolabs/zopio_init/commit/11315c2dfe78c5806b5154caa6260c34ee2f91fe))
* remove GitHub Actions caching configurations ([#23](https://github.com/zopiolabs/zopio_init/issues/23)) ([d43c98c](https://github.com/zopiolabs/zopio_init/commit/d43c98c71cf43941ecfa4683c255cde619f1b061))


### hotfix

* remove deprecated Semgrep SAST and fix staging branch trigger ([#111](https://github.com/zopiolabs/zopio_init/issues/111)) ([39b8dc0](https://github.com/zopiolabs/zopio_init/commit/39b8dc025167ce6d6a902369e01af17a274466dc))


### BREAKING CHANGES

* **ci:** Removed separate branch-naming, semantic-pr, pr-size-check, and codeql workflows. All functionality preserved in consolidated workflows.
* Semgrep SAST scanning has been removed. Projects relying on Semgrep-specific security checks should ensure CodeQL rules cover their requirements.

Co-authored-by: Umutcan ÖNER <uo@uozopio.com>



