import express from 'express';
import ratingController from '../controllers/rating.controller.js';

const ratingRouter = express.Router();


ratingRouter.get('/getRatingsByRestaurant/:res_id', ratingController.getRatingsByRestaurant);
ratingRouter.get('/getRatingsByUser/:user_id', ratingController.getRatingsByUser);
ratingRouter.post('/addRating', ratingController.addRating);



export default ratingRouter;