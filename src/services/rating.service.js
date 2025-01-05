import { BadRequestException } from "../common/helpers/error.helper.js";
import models from "../common/sequelize/init.sequelize.js";

const ratingService = {
    getRatingsByRestaurant: async (req, res, next) => {
        const { res_id } = req.params;

        const resExist = await models.restaurant.findOne({ where: { res_id }, raw: true });

        if (!resExist) throw new BadRequestException('Nhà hàng không tồn tại');

        const listRes = await models.rate_res.findAll({
            where: { res_id },
            raw: true
        });
        console.log(listRes);

        return {
            res_id: resExist.res_id,
            res_name: resExist.res_name,
            total_rate: listRes.length,
            list_rate: listRes
        };
    },
    getRatingsByUser: async (req, res, next) => {
        const { user_id } = req.params;

        const userExist = await models.user.findOne({ where: { user_id }, raw: true });

        if (!userExist) throw new BadRequestException('Người dùng không tồn tại');

        const listUser = await models.rate_res.findAll({
            where: { user_id },
            raw: true
        });

        return {
            user_id: userExist.user_id,
            user_name: userExist.user_name,
            total_rate: listUser.length,
            list_rate: listUser
        };
    },
    addRating: async (req, res, next) => {
        const { res_id, user_id, amount } = req.body;

        const resExist = await models.restaurant.findOne({ where: { res_id }, raw: true });

        if (!resExist) throw new BadRequestException('Nhà hàng không tồn tại');

        const userExist = await models.user.findOne({ where: { user_id }, raw: true });

        if (!userExist) throw new BadRequestException('Người dùng không tồn tại');

        const rateExist = await models.rate_res.findOne({ where: { res_id, user_id }, raw: true });

        if (rateExist) throw new BadRequestException('Người dùng đã đánh giá nhà hàng này');

        const rateResNew = await models.rate_res.create({ res_id, user_id, amount, date_rate: new Date() });

        return rateResNew;
    }
}
export default ratingService;