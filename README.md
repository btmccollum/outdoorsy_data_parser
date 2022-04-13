# OutdoorsyDataParser

## Getting Started

Pull down a local copy of this repository and cd into the root. Use the
following to install dependencies:

    $ bin/setup

Use the following to access the console and get started:

    $ bin/console

## Usage

This tool is intended for use with text delimited files (e.g., CSVs) containing specific information pertaining to customers and their basic vehicle details. At this time, your file should ideally be delimeted by commas, pipes, semicolons, or tabs, and contain the following information:

    $ first name, last name, vehicle name, vehicle type, vehicle length (ft)
    
To use this tool, spin up a local console with `bin/console` and try parsing a file that matches these criteria.

See documentation details below for more information, but to get started quickly and see how it works you can try the following: 

`CustomerImporter.import(file_path: "./spec/fixtures/files/commas.txt")` 

Optionally you can sort this data (asc) by any of the column types with the following:

`CustomerImporter.import(file_path: "./spec/fixtures/files/commas.txt", sort_by: 'vehicle_name')` 

If you'd prefer your sort in descending order, you can add the following:

`CustomerImporter.import(file_path: "./spec/fixtures/files/commas.txt", sort_by: 'vehicle_length_ft', sort_order: 'desc')` 

### Classes
#### `CustomerImporter`
#### Class Methods
`.import`
- Parameters:
  - `file_path` (string) - a string representing the location of a text delimited file relative to the location of this repository on your local machine
      - The text delimited file should use commas, pipes, semicolons, or tabs
      - Note that the file path needs to be relative to your current location. You can use the attached sample files for testing:
        - `CustomerImporter.import(file_path: "./spec/fixtures/files/commas.txt")` 
        - `CustomerImporter.import(file_path: "./spec/fixtures/files/pipes.txt")` 

  - `sort_by` (optional, string) - a string representing the column you with to sort the data by. Can be one of the following values:
      - full_name
      - email
      - vehicle_name
      - vehicle_type
      - vehicle_length_ft
  - `sort_order` (optional, string) - desired sorting order, only applicable if sort_by is present. Must be one of the following values:
      - asc
      - desc

- Output: 
  - Import will return an array of hashes containg customer information from the file you've provided:
  ```
    [
      {full_name: 'johnny test', email: 'j@test.com', vehicle_type: 'pattleboat', vehicle_length_ft: 6, vehicle_name: 'Treading Water'},
      {full_name: 'rachel test', email: 'r@test.com', vehicle_type: 'speedboat', vehicle_length_ft: 25, vehicle_name: 'Rachels Boat'}
    ]
  ```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/btmccollum/outdoorsy_data_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
