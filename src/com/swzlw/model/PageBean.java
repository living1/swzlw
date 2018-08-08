package com.swzlw.model;

/**
 * Created by 哈利波特 on 2017/11/4.
 */
public class PageBean {

    private int page;//�ڼ�ҳ
    private int pageSize;//ÿҳ��¼��
    private int start;//��ʼҳ

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
