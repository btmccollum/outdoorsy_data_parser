# OutdoorsyDataParser

## Getting Started

Pull down a local copy of this repository and cd into the root. Use the
following to install dependencies:

    $ bin/setup

Use the following to access the console and get started:

    $ bin/console

## Usage

This tool is intended for use with text delimited files (e.g., CSVs).
At this time, your file should contain the following informationO

    $ first name, last name, vehicle name, vehicle type, vehicle length (ft)

To parse a file of your choosing, you can run the following command:

    $ CustomerImporter.import(file_path: <path to your file>)

Note that the file path needs to be relative to your current location. You can
also use local sample files with the following:

    $ CustomerImporter.import(file_path "./spec/fixtures/files/commas.txt") 
    $ CustomerImporter.import(file_path "./spec/fixtures/files/pipes.txt") 

You can optionally sort your data by any of the following header types

If a sort by option is provided, it will be in ascending order by default. You
can pass `sort_order: 'desc'` to change this. 


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/btmccollum/outdoorsy_data_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
