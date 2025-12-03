#!/usr/bin/env bash
source /usr/lib/bashio/bashio.sh

bashio::log.info "Starting Gitea Mirror addon..."

# Generate auth secret if not already set
if [ -z "${BETTER_AUTH_SECRET:-}" ]; then
    export BETTER_AUTH_SECRET=$(openssl rand -base64 32)
    bashio::log.info "Generated BETTER_AUTH_SECRET"
fi

# Set core configuration
export NODE_ENV=production
export HOST=0.0.0.0
export PORT=4321
export DATABASE_URL=file:/data/gitea-mirror.db

# Configure for ingress - use the internal URL since we're behind HA's ingress proxy
# The app listens on this address and HA proxies requests to it
export BETTER_AUTH_URL="http://localhost:${PORT}"

# Set the base path for ingress routing
INGRESS_PATH="$(bashio::addon.ingress_url)"
export BASE_URL="${INGRESS_PATH}"
bashio::log.info "Ingress path: ${INGRESS_PATH}"
bashio::log.info "BETTER_AUTH_URL: ${BETTER_AUTH_URL}"

# GitHub Configuration
if bashio::config.has_value 'github_username'; then
    export GITHUB_USERNAME=$(bashio::config 'github_username')
fi

if bashio::config.has_value 'github_token'; then
    export GITHUB_TOKEN=$(bashio::config 'github_token')
fi

export PRIVATE_REPOSITORIES=$(bashio::config 'private_repositories')
export PUBLIC_REPOSITORIES=$(bashio::config 'public_repositories')
export MIRROR_STARRED=$(bashio::config 'mirror_starred')
export SKIP_FORKS=$(bashio::config 'skip_forks')
export INCLUDE_ARCHIVED=$(bashio::config 'include_archived')
export MIRROR_ORGANIZATIONS=$(bashio::config 'mirror_organizations')
export PRESERVE_ORG_STRUCTURE=$(bashio::config 'preserve_org_structure')
export MIRROR_STRATEGY=$(bashio::config 'mirror_strategy')

# Gitea Configuration
if bashio::config.has_value 'gitea_url'; then
    export GITEA_URL=$(bashio::config 'gitea_url')
fi

if bashio::config.has_value 'gitea_username'; then
    export GITEA_USERNAME=$(bashio::config 'gitea_username')
fi

if bashio::config.has_value 'gitea_token'; then
    export GITEA_TOKEN=$(bashio::config 'gitea_token')
fi

export GITEA_ORGANIZATION=$(bashio::config 'gitea_organization')
export GITEA_MIRROR_INTERVAL=$(bashio::config 'gitea_mirror_interval')
export GITEA_LFS=$(bashio::config 'gitea_lfs')

# Mirror Options
export MIRROR_RELEASES=$(bashio::config 'mirror_releases')
export MIRROR_WIKI=$(bashio::config 'mirror_wiki')
export MIRROR_METADATA=$(bashio::config 'mirror_metadata')
export MIRROR_ISSUES=$(bashio::config 'mirror_issues')
export MIRROR_PULL_REQUESTS=$(bashio::config 'mirror_pull_requests')
export MIRROR_LABELS=$(bashio::config 'mirror_labels')
export MIRROR_MILESTONES=$(bashio::config 'mirror_milestones')

# Automation Configuration
export SCHEDULE_ENABLED=$(bashio::config 'schedule_enabled')
export SCHEDULE_INTERVAL=$(bashio::config 'schedule_interval')
export AUTO_IMPORT_REPOS=$(bashio::config 'auto_import_repos')

# Cleanup Configuration
export CLEANUP_ENABLED=$(bashio::config 'cleanup_enabled')
export CLEANUP_RETENTION_DAYS=$(bashio::config 'cleanup_retention_days')
export CLEANUP_DELETE_IF_NOT_IN_GITHUB=$(bashio::config 'cleanup_delete_if_not_in_github')
export CLEANUP_ORPHANED_REPO_ACTION=$(bashio::config 'cleanup_orphaned_repo_action')

# Ensure data directory exists
mkdir -p /data

bashio::log.info "Configuration loaded, starting Gitea Mirror..."

# Run the original entrypoint
exec /app/docker-entrypoint.sh
