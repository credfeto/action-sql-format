import * as child from 'child_process';
import * as fs from 'fs';

const MAIN_FILE = 'main.ts';

function findNamedHandlerFile(filename: string): string | null {
    const handlerDockerFile: string = 'src/app/' + filename;
    console.log(`* Looking for ${handlerDockerFile}...`);

    if (fs.existsSync(handlerDockerFile)) {
        return handlerDockerFile;
    }
    return null;
}

function findMainFile(): string | null {
    return findNamedHandlerFile(MAIN_FILE);
}

const handlerDirectory = './src';

const targetDirectory = './';


let fullPathToMain = findMainFile();
if (!fullPathToMain) {
    console.log('Error: Cannot find app or handler with that name');
    process.exit(1);
}

console.log(`Building starting from file: ${fullPathToMain}`);


const outfile = targetDirectory + 'main.js';
console.log(`Output file: ${outfile}`);

// Actually do the compilation
console.log('Compiling...');
child.execSync(
    `esbuild ${fullPathToMain} --bundle --platform=node --define:process.env.NODE_ENV=\\\"production\\\" --outfile=${outfile}`,
    {stdio: 'inherit'},
);


const fullPathToHandlerScript = findNamedHandlerFile(handlerDirectory);
if (fullPathToHandlerScript) {
    console.log(`Using handler ${fullPathToHandlerScript}`);
    fs.copyFileSync(fullPathToHandlerScript, targetDirectory);
}

console.log('Done');
