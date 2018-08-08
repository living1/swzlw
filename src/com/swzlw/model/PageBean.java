package com.swzlw.model;

/**
 * Created by 鍝堝埄娉㈢壒 on 2017/11/4.
 */
public class PageBean {

    private int page;//第几页
    private int pageSize;//每页记录数
    private int start;//起始页

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStart() {
        return (page-1)*pageSize;
    }

    public PageBean(int page, int pageSize) {
        this.page = page;
        this.pageSize = pageSize;
    }
}
