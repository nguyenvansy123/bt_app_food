import express from 'express';
import rootRouter from './src/routers/root.router.js';
import { handleError } from './src/common/helpers/error.helper.js';

const app = express();

app.use(express.json())

app.use(rootRouter);

app.use(handleError);

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});

// npx sequelize-auto -h localhost -d db_app_food -u root -x 1234 -p 3307  --dialect mysql -o src/models -a src/models/additional.json -l esm