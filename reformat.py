#! /usr/bin/python3

import sys
import sqlparse


def read_file(file_name):
    with open(file_name, "r") as f:
        source = f.read()
        f.close()

    return source


def write_file(file_name, content):
    with open(file_name, "w") as f:
        f.write(content)


print("Reformatting files")
# Pretty print input files
for file in sys.argv[1:]:
    print("* " + file + ":")
    original = read_file(file)
    formatted = sqlparse.format(original,
                                reindent=True,
                                keyword_case='upper',
                                identifier_case='lower',
                                strip_comments=False,
                                re_indent=True,
                                reindent_aligned=True,
                                use_space_around_operators=True,
                                indent_tabs=False,
                                indent_width=2,
                                comma_first=False,
                                wrap_after=120,
                                )

    if original == formatted:
        print("  - Unchanged")
    else:
        print("  - Changed")
        write_file(file, formatted)
