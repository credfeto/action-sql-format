import argparse

# Parse command line arguments
parser = argparse.ArgumentParser(prog="reformat")
parser.add_argument("file", type=argparse.FileType("r"), nargs="+")
args = parser.parse_args()

# Pretty print input files
for file in args.file:
    print("* " + file.name + ":")
    original = file.read()
    formatted = original
    # formatted = sqlparse.format(original, reindent=True, keyword_case='upper',
    #                             strip_comments=False,
    #                             re_indent=True,
    #                             use_space_around_operators=True,
    #                             indent_tabs=False,
    #                             indent_width=2,
    #                             comma_first=False)

    if original == formatted:
        print("  - Unchanged")
    else:
        print("  - Changed")
        with open(file.name, "w") as f:

            # write to file
            f.write(formatted)
