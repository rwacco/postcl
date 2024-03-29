#!/usr/bin/env ruby

require_relative '../lib/postcl'

require 'docopt'

doc = <<DOCOPT
PostCL

Usage:
  postcl (info|status) (<barcode> <postcode>)... | -p <barcode>...
  postcl (info|status) -l [-a]
  postcl (info|status) -e
  postcl volg (<barcode> <postcode>)... | -p <barcode>...
  postcl -h | --help
  postcl -v

Options:
  -a --alles
  -l --lijst
  -e --eerstvolgende
  -h --help
  -v

DOCOPT

if __FILE__ == $0
  begin
    doc_parse =  Docopt::docopt(doc)
  rescue Docopt::Exit => e
    puts e.message
    exit 1
  end

  # Otherwise gets won't work
  ARGV.clear

  PostCL::Session.new(doc_parse)
  end
