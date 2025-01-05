import express from 'express';
import likeRouter from './like.router.js';
import ratingRouter from './rating.router.js';
import orderRouter from './order.router.js';

const rootRouter = express.Router();

rootRouter.use('/like', likeRouter);
rootRouter.use('/rating', ratingRouter);
rootRouter.use('/order', orderRouter);

export default rootRouter;