# Bugcrowd Methodology Taxonomy Rubygem

![build BMT](https://github.com/bugcrowd/bmt-ruby/actions/workflows/build.yml/badge.svg?branch=main)

While the Content and Structure is defined in the [Methodology Taxonomy](https://github.com/bugcrowd/methodology-taxonomy), this defines methods to allow for easy handling of methodologies logic.  This gem is used and maintained by [Bugcrowd Engineering](https://bugcrowd.com).

## Submodule Versioning Strategy

This gem uses a **versioned submodule approach** to ensure backward compatibility and prevent breaking changes (like step not found or empty checklist title or description) in active pentest engagements when a hacker tries to complete a methodology:

### How It Works
- Each gem version should have a corresponding submodule directory in `lib/data/`
- When methodology-taxonomy is updated, a new submodule directory should be created matching the gem version
- Existing pentest engagements continue using their original methodology version
- New pentest engagements can use the latest methodologies when a hacker tries to complete those methodologies

### Example Structure
```
lib/data/
├── 0.1/    # Legacy methodologies
├── 0.9/    # Previous version methodologies  
├── 1.0/    # Current version methodologies
└── 1.1/    # Latest version methodologies
```

### Why This Matters
- **Prevents Breaking Changes**: Step keys, item keys, and methodology structure changes won't break existing pentest engagements in CrowdControl
- **Maintains Backward Compatibility**: Hacker can complete the methodology for a pentest engagement using the methodology version they started with
- **Enables Updates**: New pentest engagements benefit from the latest methodology improvements/updates

### Versioning Pattern
- **Major/Minor versions** get their own submodule directory (e.g., `0.1/`, `0.9/`, `1.0/`)
- **Patch versions** within the same minor version share the same submodule directory
- **Latest directory** contains the most recent methodology updates
- **Legacy directories** are maintained for backward compatibility with existing engagements

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bmt-ruby'
```

## Usage

For convenience in development, we provide a utility for spinning up a
playground for playing with the gem. You can invoke it with:

```bash
bin/console
```
