package cn.com.dyninfo.o2o.communication;

import cn.com.dyninfo.o2o.communication.common.BaseResult;
import cn.com.dyninfo.o2o.entity.Coupon;

import java.util.List;

/**
 * Created by Administrator on 2016/7/29.
 */
public class SubmitOrderResult extends BaseResult {

    //可使用的优惠券列表
    private List<Coupon> couponList;


    public List<Coupon> getCouponList() {
        return couponList;
    }

    public void setCouponList(List<Coupon> couponList) {
        this.couponList = couponList;
    }

    @Override
    public String toString() {
        return "CreateOrderResult{" +
                "couponList=" + couponList +
                '}';
    }
}
