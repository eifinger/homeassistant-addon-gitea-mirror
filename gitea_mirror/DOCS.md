# Gitea Mirror Add-on for Home Assistant

Automatically mirror repositories from GitHub to your self-hosted Gitea/Forgejo instance.

## About

This add-on wraps [Gitea Mirror](https://github.com/RayLabsHQ/gitea-mirror), providing an easy way to automatically sync your GitHub repositories to a self-hosted Gitea or Forgejo instance running alongside Home Assistant.

## Features

- Mirror public, private, and starred GitHub repos to Gitea
- Mirror entire organizations with flexible strategies
- Custom destination control for repos and organizations
- Git LFS support
- Metadata mirroring (issues, pull requests, labels, milestones, wiki)
- Scheduled automatic mirroring
- Auto-discovery of new GitHub repositories
- Repository cleanup for deleted GitHub repos
- Web UI for configuration and monitoring

## Installation

1. Add this repository to your Home Assistant Add-on Store
2. Install the Gitea Mirror add-on
3. Configure the add-on (see Configuration section below)
4. Start the add-on
5. Access the web UI through the sidebar or ingress

## Configuration

### Required Settings

Before the add-on can work, you need to configure:

1. **GitHub Settings**:
   - `github_username`: Your GitHub username
   - `github_token`: A GitHub personal access token with `repo` and `admin:org` scopes

2. **Gitea Settings**:
   - `gitea_url`: URL of your Gitea/Forgejo instance (e.g., `http://192.168.1.100:3000`)
   - `gitea_username`: Your Gitea username
   - `gitea_token`: A Gitea access token with repository and organization permissions

### GitHub Token

Create a GitHub personal access token at https://github.com/settings/tokens with the following scopes:
- `repo` (Full control of private repositories)
- `admin:org` (Read organization data)

### Gitea Token

Create a Gitea access token in your Gitea instance under Settings > Applications > Generate New Token.

### Configuration Options

| Option | Description | Default |
|--------|-------------|---------|
| `github_username` | Your GitHub username | (required) |
| `github_token` | GitHub personal access token | (required) |
| `gitea_url` | Gitea instance URL | (required) |
| `gitea_username` | Gitea username | (required) |
| `gitea_token` | Gitea access token | (required) |
| `gitea_organization` | Default organization for mirrors | `github-mirrors` |
| `private_repositories` | Include private repos | `false` |
| `public_repositories` | Include public repos | `true` |
| `mirror_starred` | Mirror starred repos | `false` |
| `skip_forks` | Skip forked repos | `false` |
| `include_archived` | Include archived repos | `false` |
| `mirror_organizations` | Mirror org repos | `false` |
| `preserve_org_structure` | Keep org structure in Gitea | `false` |
| `mirror_strategy` | Organization strategy | `preserve` |
| `gitea_mirror_interval` | Sync interval | `8h` |
| `mirror_releases` | Mirror releases | `false` |
| `mirror_wiki` | Mirror wiki | `false` |
| `mirror_metadata` | Enable metadata mirroring | `false` |
| `mirror_issues` | Mirror issues | `false` |
| `mirror_pull_requests` | Mirror PRs as issues | `false` |
| `mirror_labels` | Mirror labels | `false` |
| `mirror_milestones` | Mirror milestones | `false` |
| `gitea_lfs` | Enable Git LFS | `false` |
| `schedule_enabled` | Enable scheduled sync | `false` |
| `schedule_interval` | Sync interval (seconds) | `3600` |
| `auto_import_repos` | Auto-discover new repos | `true` |
| `cleanup_enabled` | Enable cleanup | `false` |
| `cleanup_retention_days` | Days to keep events | `7` |
| `cleanup_delete_if_not_in_github` | Handle orphaned repos | `false` |
| `cleanup_orphaned_repo_action` | Action for orphans | `archive` |

### Mirror Strategies

- **preserve**: Maintains GitHub organization structure
- **single-org**: All repos go to one Gitea organization
- **flat-user**: All repos under your Gitea user account
- **mixed**: Personal repos in one org, organization repos preserve structure

## First Time Setup

1. Start the add-on
2. Open the Web UI from the sidebar
3. Create an admin account (first user becomes admin)
4. Configure GitHub and Gitea connections through the web interface
5. Import and mirror your repositories

## Web UI

The add-on provides a web interface accessible through Home Assistant's ingress. From there you can:

- View and manage mirrored repositories
- Import new repositories
- Configure mirror settings
- View activity logs
- Trigger manual syncs

## Support

- [Gitea Mirror Documentation](https://github.com/RayLabsHQ/gitea-mirror)
- [Report Issues](https://github.com/RayLabsHQ/gitea-mirror/issues)
- [Discussions](https://github.com/RayLabsHQ/gitea-mirror/discussions)
