import { responseSuccess } from "../common/helpers/response.helper.js";
import ratingService from "../services/rating.service.js";

const ratingController = {
    getRatingsByRestaurant: async (req, res, next) => {
        try {
            const data = await ratingService.getRatingsByRestaurant(req, res, next);
            const resData = responseSuccess(data, 'Get rating restaurant success', 200);
            res.status(resData.code).json(resData);
        } catch (error) {
            next(error);
        }
    },
    getRatingsByUser: async (req, res, next) => {
        try {
            const data = await ratingService.getRatingsByUser(req, res, next);
            const resData = responseSuccess(data, 'Get rating user success', 200);
            res.status(resData.code).json(resData);
        } catch (error) {
            next(error);
        }
    },
    addRating: async (req, res, next) => {
        try {
            const data = await ratingService.addRating(req, res, next);
            const resData = responseSuccess(data, 'Rating restaurant success', 201);
            res.status(resData.code).json(resData);
        } catch (error) {
            next(error);
        }
    }
};

export default ratingController;