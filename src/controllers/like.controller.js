import { responseSuccess } from "../common/helpers/response.helper.js";
import likeService from "../services/like.service.js";

const likeController = {
    getLikesByRestaurant: async (req, res, next) => {
        try {
            const data = await likeService.getLikesByRestaurant(req, res, next);
            const resData = responseSuccess(data, 'Lấy danh sách like theo nhà hàng thành công', 200);
            res.status(resData.code).json(resData);
        } catch (error) {
            next(error)
        }
    },
    getLikesByUser: async (req, res, next) => {
        try {
            const data = await likeService.getLikesByUser(req, res, next);
            const resData = responseSuccess(data, 'Lấy danh sách like theo người dùng thành công', 200);
            res.status(resData.code).json(resData);

        } catch (error) {
            next(error)
        }
    },
    likeRestaurant: async (req, res, next) => {
        try {
            const data = await likeService.likeRestaurant(req, res, next);
            const resData = responseSuccess(data, 'Like nhà hàng thành công', 201);
            res.status(resData.code).json(resData);
        } catch (error) {
            next(error)
        }
    },
    unlikeRestaurant: async (req, res, next) => {
        try {
            const data = await likeService.unlikeRestaurant(req, res, next);
            const resData = responseSuccess(data, 'Unlike nhà hàng thành công', 200);
            res.status(resData.code).json(resData);
        } catch (error) {
            next(error)
        }
    }
}

export default likeController;