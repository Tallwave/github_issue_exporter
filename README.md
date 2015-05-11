# GitHub Issue Exporter

[![Circle CI](https://circleci.com/gh/Tallwave/github_issue_exporter.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/Tallwave/github_issue_exporter) [![Code Climate](https://codeclimate.com/github/Tallwave/github_issue_exporter/badges/gpa.svg)](https://codeclimate.com/github/Tallwave/github_issue_exporter)

Need to archive some repositories that are stored on GitHub? Great. Don't forget to hold on to any open issues you may still have. GitHub Issue Exporter is a command-line utility that will download all the open issues for a single repository.

## Installation

GitHub Issue Exporter is built with Ruby and needs Ruby 2.0 or higher. Install it with RubyGems.

```
gem install github_issue_exporter
```

Some environments may require `sudo` permissions.

```
sudo gem install github_issue_exporter
```

## Usage
You'll need 3 things to run this, the name of the owner of the repository, the repository name, and an access token that has the authority to download the Issues. You can generate this token from [here](https://github.com/settings/tokens), and clicking on "Generate new token". Here's a [blog post with some more of the details involved](http://blog.swilliams.me/words/2015/04/01/two-factor-authentication-for-github/).

The Exporter has a couple of options.

`--multiple-files` By default Issue Exporter downloads and stores all the issues into a single JSON file. Setting the `multiple-files` flag will create a separate file for each Issue.

`--output` Set the directory to store the issues in. By default it is the current directory.

The issues will be exported into either a single `issues.json` file or multiple `issue-[NUMBER].json` files.

### Example

```
export-github-issues tallwave github_issue_exporter [TOKEN]

export-github-issues --multiple-files --output ~/issues tallwave github_issue_exporter [TOKEN]
```

## Roadmap

 * Import issues back into a repository.

## Contributing

 * Fork
 * Make it better
 * Create a Pull Request
