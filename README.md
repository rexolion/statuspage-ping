# AutoStatusPageUpdater

Automate status updates for Atlassian Statuspage using Bash scripting. This script allows you to periodically ping multiple URLs and update corresponding Statuspage components based on their availability.

## Features

- Ping multiple URLs at specified intervals.
- Update Atlassian Statuspage components' status based on URL availability.
- Configurable mapping of URLs to Statuspage component IDs.
- Uses curl for sending API requests and checking URLs.

## Usage

1. Configure the URL to component ID mapping in the script.
2. Replace placeholders with your Statuspage API key, page ID, and component IDs.
3. Run the script to start automated status updates.

**Note**: Thoroughly test the script in a controlled environment before deploying to production.

## Configuration

Modify the following variables in the script:

- `URL_COMPONENT_MAP`: Map URLs to Statuspage component IDs.
- `STATUSPAGE_API_KEY`: Your Statuspage API key.
- `PAGE_ID`: Your Statuspage Page ID.

## Getting Started

1. Clone this repository.
2. Configure the script as described above.
