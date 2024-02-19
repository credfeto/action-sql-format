import {
    bigquery, db2,
    db2i,
    DialectOptions,
    hive,
    mariadb, mysql, n1ql, redshift, singlestoredb,
    snowflake,
    spark,
    sql,
    sqlite,
    transactsql,
    trino
} from "sql-formatter";

export function getSqlDialect(dialect: string): DialectOptions {

    switch (dialect.toLowerCase())
    {
        case 'bigquery':
            return bigquery;
        case 'db2':
            return db2;
        case 'db2i':
            return db2i;
        case 'hive':
            return hive;
        case 'mariadb':
            return mariadb;
        case 'mysql':
            return mysql;
        case 'n1ql':
            return n1ql;
        case 'plsql':
            case 'postgresql':
        case 'redshift':
            return redshift;
        case 'singlestoredb':
            return singlestoredb;
        case 'snowflake':
            return snowflake;
        case 'spark':
            return spark;
        case  'sql':
            return sql;
        case 'sqlite':
            return sqlite;
        case 'tsql':
        case 'transactsql':
        {
            const d : DialectOptions = {
                ...transactsql,
                name: 'tsql',
            };

            d.tokenizerOptions.reservedKeywords = [...d.tokenizerOptions.reservedKeywords, 'GO']
            d.tokenizerOptions.identTypes = [ ...d.tokenizerOptions.identTypes ]
            return d;
        }

        case 'trino':
            return trino;
        default:
            throw new Error('Function not implemented.');
    }
}
