# Home Assistant Add-on: Gitea Mirror

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE)

Automatically mirror repositories from GitHub to your self-hosted Gitea/Forgejo instance.

## About

This Home Assistant add-on wraps [Gitea Mirror](https://github.com/RayLabsHQ/gitea-mirror), providing an easy way to automatically sync your GitHub repositories to a self-hosted Gitea or Forgejo instance.

## Features

- Mirror public, private, and starred GitHub repos to Gitea
- Mirror entire organizations with flexible strategies
- Custom destination control for repos and organizations
- Git LFS support
- Metadata mirroring (issues, pull requests, labels, milestones, wiki)
- Scheduled automatic mirroring
- Auto-discovery of new GitHub repositories
- Repository cleanup for deleted GitHub repos
- Sleek Web UI for configuration and monitoring

## Installation

1. Add this repository to your Home Assistant instance:

   [![Add Repository][repository-badge]][repository-url]

   Or manually add the repository URL:
   ```
   https://github.com/eifinger/homeassistant-addon-gitea-mirror
   ```

2. Install the "Gitea Mirror" add-on
3. Configure the add-on with your GitHub and Gitea credentials
4. Start the add-on
5. Access the Web UI through the sidebar

## Documentation

See the [documentation](gitea_mirror/DOCS.md) for detailed configuration options.

## Support

- [Gitea Mirror Project](https://github.com/RayLabsHQ/gitea-mirror)
- [Report Issues](https://github.com/RayLabsHQ/gitea-mirror/issues)

## License

MIT License - See [LICENSE](LICENSE) for details.

[releases-shield]: https://img.shields.io/github/release/eifinger/homeassistant-addon-gitea-mirror.svg
[releases]: https://github.com/eifinger/homeassistant-addon-gitea-mirror/releases
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[license-shield]: https://img.shields.io/github/license/eifinger/homeassistant-addon-gitea-mirror.svg
[repository-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Feifinger%2Fhomeassistant-addon-gitea-mirror
