import { BadRequestException } from "../common/helpers/error.helper.js";
import models from "../common/sequelize/init.sequelize.js";

const orderService = {
    orderFood: async (req, res, next) => {
        const { user_id, food_id, amount, arr_sub_id } = req.body;

        const userExist = await models.user.findOne({ where: { user_id }, raw: true });
        if (!userExist) throw new BadRequestException('Người dùng không tồn tại');

        const foodExist = await models.food.findOne({ where: { food_id }, raw: true });
        if (!foodExist) throw new BadRequestException('Món ăn không tồn tại');


        if (Array.isArray(arr_sub_id) && arr_sub_id.length > 0)
            for (let i = 0; i < arr_sub_id.length; i++) {
                const subfoodId = arr_sub_id[i];
                const subFoodExist = await models.sub_food.findOne({ where: { sub_id: subfoodId, food_id }, raw: true });
                if (!subFoodExist) throw new BadRequestException('Món ăn kèm không thuộc món ăn chính');
            }

        const newOrder = await models.orders.create({ user_id, food_id, amount, arr_sub_id: `${arr_sub_id}`, code: Math.random().toString(36).substring(7) });

        return newOrder;

    }

};

export default orderService;