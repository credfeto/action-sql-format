import {
    bigquery,
    DialectOptions,
    format,
    FormatOptionsWithDialect,
    FormatOptionsWithLanguage,
    hive
} from 'sql-formatter';
import core from '@actions/core';
import * as fs from 'fs';
import {glob} from "glob";
import {getSqlDialect} from "./getDialect";

function buildOptions(dialect: string): FormatOptionsWithDialect {

    const options: FormatOptionsWithDialect = {
        tabWidth: 2,
        useTabs: false,
        keywordCase: 'upper',
        identifierCase: 'preserve',
        dataTypeCase: 'upper',
        functionCase: 'preserve',
        indentStyle: 'standard',
        logicalOperatorNewline: 'before',
        expressionWidth: 50,
        linesBetweenQueries: 1,
        denseOperators: true,
        newlineBeforeSemicolon: false,
        dialect: getSqlDialect(dialect)
    };

    console.log(`Using Dialect: ${options.dialect.name}`);

    return options;
}

function getInput(name: string): string {
    try {
        return core.getInput('dialect');
    } catch {
        return 'tsql';
    }
}


export const main = async (): Promise<void> => {
    console.log('reformatter')
    try {

        const dialect = getInput('dialect');

        console.log(`Dialect: ${dialect}`);

        const options = buildOptions(dialect);


        console.log('looking for files')
        const sqlFiles = await glob('**/*.sql', {ignore: 'node_modules/**'});

        console.log(`found ${sqlFiles.length} files`);

        for (const file of sqlFiles) {
            console.log(`${file}:`);
            const content = fs.readFileSync(file, 'utf8');
            try {
                const formatted = format(content, options);
                if (content === formatted) {
                    console.log(` * Unchanged`)
                } else {
                    console.log(` * Changed`)
                    //console.log(formatted);
                    fs.writeFileSync(file, formatted, 'utf8');
                }
            }
            catch(e) {
                console.error(` * Error: ${e}`);
            }
        }


    } catch (error) {
        console.error(error!.toString());
    }


}

(async () => {
    await main();
})();
