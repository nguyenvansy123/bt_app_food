import { responseSuccess } from "../common/helpers/response.helper.js";
import orderService from "../services/order.service.js";

const orderController = {
    orderFood: async (req, res,next) => {
        try {
            const data = await orderService.orderFood(req, res, next);
            const resData = responseSuccess(data, 'Đặt món thành công', 201);
            res.status(resData.code).json(resData);
        } catch (error) {
            next(error);
        }
    }

};

export default orderController;