import express from 'express';
import likeController from '../controllers/like.controller.js';

const restaurantRouter = express.Router();

restaurantRouter.get('/getLikesByRestaurant/:res_id', likeController.getLikesByRestaurant);
restaurantRouter.get('/getLikesByUser/:user_id', likeController.getLikesByUser);
restaurantRouter.post('/likeRestaurant', likeController.likeRestaurant);
restaurantRouter.post('/unlikeRestaurant', likeController.unlikeRestaurant);

export default restaurantRouter;

