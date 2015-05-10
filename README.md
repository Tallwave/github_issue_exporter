# GitHub Issue Exporter

Need to archive some repositories that are stored on GitHub? Great. Don't forget to hold on to any open issues you may still have. GitHub Issue Exporter is a command-line utility that will download all the open issues for a single repository.

## Installation

GitHub Issue Exporter is built with Ruby and needs Ruby 2.0 or higher. Install it with RubyGems.

```
gem install something
```

Some environments may require `sudo` permissions.

```
sudo gem install something
```

## Usage
The Exporter has a couple of options.

`--multiple-files` By default Issue Exporter downloads and stores all the issues into a single JSON file. Setting the `multiple-files` flag will create a separate file for each Issue.

`--output` Set the directory to store the issues in. By default it is the current directory.

## Roadmap

 * Import issues back into a repository.
 * Allow outputting to stdout.
