import { Sequelize } from 'sequelize';
import { DATABASE_URL } from '../contant/app.contant.js';
import initModels from '../../models/init-models.js';


export const sequelize = new Sequelize(DATABASE_URL, { logging: false });
const models = initModels(sequelize);

sequelize.authenticate()
    .then(() => { console.log('kết nối database thành công'); })
    .catch(() => { console.error('kết nối database không thành công'); });

export default models;