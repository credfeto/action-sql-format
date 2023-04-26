import argparse
import sqlparse

# Parse command line arguments
parser = argparse.ArgumentParser(prog="pretty_print_sql")
parser.add_argument("file", type=argparse.FileType("r"), nargs="+")
args = parser.parse_args()

# Pretty print input files
for file in args.file:
    print(sqlparse.format(file.read(), reindent=True, keyword_case='upper'))