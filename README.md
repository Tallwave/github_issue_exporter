# GitHub Issue Exporter

[![Circle CI](https://circleci.com/gh/Tallwave/github_issue_exporter.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/Tallwave/github_issue_exporter) [![Code Climate](https://codeclimate.com/github/Tallwave/github_issue_exporter/badges/gpa.svg)](https://codeclimate.com/github/Tallwave/github_issue_exporter)

Need to archive some repositories that are stored on GitHub? Great. Don't forget to hold on to any open issues you may still have. GitHub Issue Exporter is a command-line utility that will download all the open issues for a single repository.

There's also another executable for importing those issues back into a repository, so you can resurrect an archived repository with all of its issues.

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
There are two executables, `export-github-issues` and `import-github-issues`. Both reneed at least three things to run, the owner of the repository, the repository name, and an access token that has the authority to download the Issues. You can generate this token from [here](https://github.com/settings/tokens), and clicking on "Generate new token". Here's a [blog post with some more of the details involved](http://blog.swilliams.me/words/2015/04/01/two-factor-authentication-for-github/).

### export-github-issues

The Exporter has a couple of options.

`--multiple-files` By default Issue Exporter downloads and stores all the issues into a single JSON file. Setting the `multiple-files` flag will create a separate file for each Issue.

`--output` Set the directory to store the issues in. By default it is the current directory.

The issues will be exported into either a single `issues.json` file or multiple `issue-[NUMBER].json` files.

### Example

```
export-github-issues tallwave github_issue_exporter [TOKEN]

export-github-issues --multiple-files --output ~/issues tallwave github_issue_exporter [TOKEN]
```

### import-github-issues
You can import issues a couple of different ways. First is to provide the name of each JSON file created by the exporter.

```
import-github-issues issues.json more-issues.json tallwave github_issue_exporter [TOKEN]
```

Or you can use the `--directory` flag and load all the JSON files in the specified directory.

```
import-github-issues --directory ~/issues tallwave github_issue_exporter [TOKEN]
```

#### Importer Notes
* Issues will be added to the repository as if they were brand new, so old issue numbers will not be used.
* If your user does not have push access to the repository, assignees, milestones, and labels will not be set. Read more in the [GitHub documentation](https://developer.github.com/v3/issues/#create-an-issue).

## Roadmap

 * Better error handling.
 * Create a GitHub 'application' so that the user doesn't need the auth token.

## Contributing

 * Fork
 * Make it better
 * Create a Pull Request
