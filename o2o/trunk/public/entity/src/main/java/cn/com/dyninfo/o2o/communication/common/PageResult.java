package cn.com.dyninfo.o2o.communication.common;

/**
 * Created by Administrator on 2016/7/25.
 */
public class PageResult extends BaseResult {

    private int pageNo;

    private int totalPage;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
