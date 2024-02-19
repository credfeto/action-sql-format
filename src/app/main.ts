import {format, FormatOptionsWithLanguage} from 'sql-formatter';
import core from '@actions/core';
import * as fs from 'fs';
import {glob} from "glob";


function buildOptions(dialect: string): FormatOptionsWithLanguage {
    const language = dialect.toLowerCase();
    if (language === 'bigquery' || language === 'db2' || language === 'db2i' || language === 'hive' || language === 'mariadb' || language === 'mysql' || language === 'n1ql' || language === 'plsql' || language === 'postgresql' || language === 'redshift' || language === 'singlestoredb' || language === 'snowflake' || language === 'spark' || language === 'sql' || language === 'sqlite' || language === 'transactsql' || language === 'trino') {

        const options: FormatOptionsWithLanguage = {
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
            denseOperators: false,
            newlineBeforeSemicolon: false,
            language: language
        };

        return options;
    }

    throw new Error('Invalid language');
}


export const main = async (): Promise<void> => {
    console.log('reformatter')
    try {
        const dialect = core.getInput('dialect') ?? 'tsql';

        const options = buildOptions(dialect);


        console.log('looking for files')
        const sqlFiles = await glob('**/*.sql', {ignore: 'node_modules/**'});

        console.log(`found ${sqlFiles.length} files`);

        for (const file in sqlFiles) {
            console.log(file);
            const content = fs.readFileSync(file, 'utf8');
            const formatted = format(content, options);
        }


    } catch (error) {
        core.setFailed(error!.toString());
    }


}
