# CodeUnity Buy Illegal Items

## Introduction

This script introduces an interactive scenario in your game environment where players can engage with an NPC named Morrey to buy illegal items. The script provides a customizable configuration to tailor the experience to your server's needs.

## Getting Started

### Prerequisites
Make sure you have the necessary resources and dependencies installed for your game server.

### Installation
1. Copy the `CodeUnity_BuyIllegalItems` folder into your server's resources directory.
2. Add `start CodeUnity_BuyIllegalItems` to your server.cfg file.

## Configuration

### `CodeUnity_BuyIllegalItems_Cfg`

The configuration file allows you to customize various aspects of the illegal items purchase system.

#### NPC Settings (`CodeUnity_BuyIllegalItems_Cfg.NPC`)

- `name`: Name of the NPC (e.g., 'Morrey').
- `coords`: Coordinates where the NPC will be placed (x, y, z, heading).
- `model`: Model of the NPC character.
- `cam_coords`: Camera coordinates for the NPC interaction scene.
- `Dialogues`: Dialogues between the NPC and the player, categorized by language.

#### Black Money (`CodeUnity_BuyIllegalItems_Cfg.Black_Money`)

- `true` if black money is used for transactions, `false` if regular money is used.

#### Item List (`CodeUnity_BuyIllegalItems_Cfg.Items`)

- Define illegal items for sale, including name, item code, and price.

#### Language (`CodeUnity_BuyIllegalItems_Cfg.Language`)

- Set the default language for dialogues (e.g., 'en' for English).

#### Vehicle Settings (`CodeUnity_BuyIllegalItems_Cfg.Vehicle`)

- `Vehicle_Name`: Name of the vehicle to be spawned.
- `Spawn_Coords`: Coordinates where the vehicle will be spawned (x, y, z, heading).

#### Language Localization (`CodeUnity_BuyIllegalItems_Cfg.Lang`)

- Define language-specific texts for various messages and notifications.

#### Notification Function (`CodeUnity_BuyIllegalItems_Cfg.Notify`)

- Customize how notifications are displayed to players.

## Usage

Interact with the NPC Morrey by approaching him and initiating a conversation. Follow the dialogues, choose the quantity of illegal items, and complete the transaction. If the spawn location is occupied, a notification will be displayed.

Watch the script preview [here](https://youtu.be/OLCQB8Iks70).

Join our Discord community:
- [CodeUnity Discord](https://discord.gg/codeunity)
- [Server Support Discord](https://discord.gg/KHNKQdKJDu)

Feel free to reach out for assistance or to share your feedback!

## Credits

This script is developed by the CodeUnity community. Special thanks to Morrey for his role in the preview video.

**Note:** Ensure proper attribution and compliance with any licensing agreements for third-party resources used in the script.

Enjoy the immersive world of illegal item transactions in your game environment!
