import { BadRequestException } from "../common/helpers/error.helper.js";
import models from "../common/sequelize/init.sequelize.js";

const likeService = {
    getLikesByRestaurant: async (req, res, next) => {
        const { res_id } = req.params;

        const resExist = await models.restaurant.findOne({ where: { res_id }, raw: true });

        if (!resExist) throw new BadRequestException('Nhà hàng không tồn tại');

        const listRes = await models.like_res.findAll({
            where: { res_id },
            raw: true
        });

        return {
            res_id: resExist.res_id,
            res_name: resExist.res_name,
            total_like: listRes.length,
            list_like: listRes
        };
    },
    getLikesByUser: async (req, res, next) => {
        const { user_id } = req.params;

        const userExist = await models.user.findOne({ where: { user_id }, raw: true });

        if (!userExist) throw new BadRequestException('Người dùng không tồn tại');

        const listUser = await models.like_res.findAll({
            where: { user_id },
            raw: true
        });

        return {
            user_id: userExist.user_id,
            user_name: userExist.full_name,
            total_like: listUser.length,
            list_Res: listUser
        };
    },
    likeRestaurant: async (req, res, next) => {
        const { res_id, user_id } = req.body;

        const resExist = await models.restaurant.findOne({ where: { res_id }, raw: true });

        if (!resExist) throw new BadRequestException('Nhà hàng không tồn tại');

        const userExist = await models.user.findOne({ where: { user_id }, raw: true });

        if (!userExist) throw new BadRequestException('Người dùng không tồn tại');

        const likeExist = await models.like_res.findOne({ where: { res_id, user_id }, raw: true });

        if (likeExist) throw new BadRequestException('Người dùng đã like nhà hàng này');

        const likeResNew = await models.like_res.create({ res_id, user_id, date_like: new Date() });

        return likeResNew;
    },
    unlikeRestaurant: async (req, res, next) => {
        const { res_id, user_id } = req.body;

        const resExist = await models.restaurant.findOne({ where: { res_id }, raw: true });

        if (!resExist) throw new BadRequestException('Nhà hàng không tồn tại');

        const userExist = await models.user.findOne({ where: { user_id }, raw: true });

        if (!userExist) throw new BadRequestException('Người dùng không tồn tại');

        const likeExist = await models.like_res.findOne({ where: { res_id, user_id }, raw: true });

        if (!likeExist) throw new BadRequestException('Người dùng chưa like nhà hàng này');

        await models.like_res.destroy({ where: { res_id, user_id } });

        return 'Unlike success';
    }

}

export default likeService;