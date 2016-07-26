package com.wckj.gfsj.Activity;

import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.wckj.gfsj.Bean.TimeEvent;
import com.wckj.gfsj.CustomUi.FrameLoadLayout;
import com.wckj.gfsj.R;

import de.greenrobot.event.EventBus;
import de.greenrobot.event.Subscribe;
import de.greenrobot.event.ThreadMode;

/**
 * 商品详情信息展示付款
 */
public class CommoditydetailsActivity extends BaseNewActivity implements View.OnClickListener{
    private TextView tv_time;
    private Button bt_buy;

    @Override
    protected void init() {
        EventBus.getDefault().register(this);

    }

    @Override
    protected View onCreateTitleView(LayoutInflater inflater) {
        View titleView = inflater.inflate(R.layout.layout_title_main_go_back, null);
        titleView. findViewById(R.id.tv_go_back).setOnClickListener(this);
        titleView . findViewById(R.id.tv_content_desc).setVisibility(View.GONE);

        tv_time = (TextView) titleView.findViewById(R.id.tv_time);
        return titleView;
    }

    @Override
    protected View onCreateSuccessView() {
        View view = inflater.inflate(R.layout.activity_commodity_details, null);
        bt_buy = (Button) view.findViewById(R.id.bt_buy);
        bt_buy.setOnClickListener(this);
        return view;
    }

    @Override
    protected void refreshOrLoadView() {

    }

    @Override
    protected void load() {
        showPageState(FrameLoadLayout.LoadResult.success);
    }

    @Subscribe(threadMode = ThreadMode.MainThread)
   public void  onMainTimeEvent(TimeEvent time){
        if(tv_time!=null){
            tv_time.setText(time.getTime());
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.tv_go_back:
                finish();
                break;
            case R.id.bt_buy:
                startActivity(new Intent(this,ShoppingCartActivity.class));
                break;
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        EventBus.getDefault().unregister(this);
    }
}