import * as fs from 'fs';
import * as path from 'path';
import YAML from 'yaml';
import express, { Application } from 'express';
import { json } from 'body-parser';
import swaggerUi from 'swagger-ui-express';

import routes from './routes/routes';

const app: Application = express();

// Load the Swagger file
const swaggerFile = path.resolve(__dirname, './routes/openapi/openapi.json');
const swaggerData = fs.readFileSync(swaggerFile, 'utf8');
const swaggerDocument = YAML.parse(swaggerData);

app.use(json()); // Middleware to parse JSON

app.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.use('/api', routes); // Set up API routes

export default app;