# Virust::Locator::Ruby

Wrapper for viRust-locator, a Rust API for simplied LANL HIV Locator tool.

## Installation

```bash
bundle add virust-locator-ruby
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install virust-locator-ruby
```

## Usage

```ruby
require 'virust_locator'
VirustLocator::Locator.exec("GAAAGCATAGTAATATGGGGAAAGACTCCTAAA")
```

=>

"3681\t3713\t100\tfalse\tGAAAGCATAGTAATATGGGGAAAGACTCCTAAA\tGAAAGCATAGTAATATGGGGAAAGACTCCTAAA"

More options for `virust-locator`

Usage: virust-locator [OPTIONS] --query <QUERY>

Options:

-q, --query <QUERY> Query sequence

-r, --reference <REFERENCE> Reference genome, either HXB2 or SIVmm239 [default: HXB2]

-t, --type-query <TYPE_QUERY> Type of query, either nt or aa [default: nt]

-a, --algorithm <ALGORITHM> algorithm for locator, 1 is accurate but slower, 2 is fast but less accurate, suitable for smaller query sequences [default: 1]

-h, --help Print help

-V, --version Print version

## Change Log

### v0.3.0

1. Fixed a bug for displaying the aligned sequences.

2. Now allow multiple sequences to be run at one time. When running multiple sequences in one query (seperate each with [whitespace]), return object is the locator results one line per query.

### v0.2.0

1. Fixed a bug for showing the aligned sequences.

2. Fixed a bug that slowed down the performance.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/virust-locator-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/virust-locator-ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Virust::Locator::Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/virust-locator-ruby/blob/main/CODE_OF_CONDUCT.md).
