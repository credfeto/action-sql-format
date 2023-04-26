import argparse

import sqlparse

# Parse command line arguments
parser = argparse.ArgumentParser(prog="reformat")
parser.add_argument("file", type=argparse.FileType("r"), nargs="+")
args = parser.parse_args()

# Pretty print input files
for file in args.file:
    original = file.read()
    formatted = sqlparse.format(original, reindent=True, keyword_case='upper',
                                strip_comments=False,
                                re_indent=True,
                                use_space_around_operators=True,
                                indent_tabs=False,
                                indent_width=2,
                                comma_first=False)

    if original == formatted:
        print(file.name + ": Unchanged")
    else:
        print(file.name + ": Changed")
        with open(file.name, "w") as f:

            # write to file
            f.write(formatted)
