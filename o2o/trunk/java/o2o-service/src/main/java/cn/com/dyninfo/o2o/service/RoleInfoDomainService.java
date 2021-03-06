package cn.com.dyninfo.o2o.service;

import cn.com.dyninfo.o2o.common.mapper.BaseMapper;
import cn.com.dyninfo.o2o.common.service.BaseService;
import cn.com.dyninfo.o2o.dao.RoleInfoModelMapper;
import cn.com.dyninfo.o2o.domain.RoleInfoDomain;
import cn.com.dyninfo.o2o.mapper.RoleInfoDomainMapper;
import cn.com.dyninfo.o2o.model.RoleInfoModelCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * Created by Administrator on 2016/7/19.
 */
@Service
@Transactional
public class RoleInfoDomainService extends BaseService<RoleInfoDomain, RoleInfoModelCriteria> {

    @Autowired
    RoleInfoDomainMapper domainMapper;

    @Autowired
    RoleInfoModelMapper modelMapper;

    @Override
    public BaseMapper<RoleInfoDomain, RoleInfoModelCriteria> getDomainMapper() {
        return domainMapper;
    }

    @Override
    public int insert(RoleInfoDomain domain) {
        return modelMapper.insert(domain);
    }

    @Override
    public int insertSelective(RoleInfoDomain domain) {
        return modelMapper.insertSelective(domain);
    }

    @Override
    public int updateByPrimaryKey(RoleInfoDomain domain) {
        return modelMapper.updateByPrimaryKey(domain);
    }

    @Override
    public int updateByPrimaryKeySelective(RoleInfoDomain domain) {
        return modelMapper.updateByPrimaryKeySelective(domain);
    }

    @Override
    public int updateByModelCriteriaSelective(RoleInfoDomain domain, RoleInfoModelCriteria criteria) {
        return modelMapper.updateByExampleSelective(domain, criteria);
    }

    @Override
    public int updateByModelCriteria(RoleInfoDomain domain, RoleInfoModelCriteria criteria) {
        return modelMapper.updateByExample(domain, criteria);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return modelMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteByMapCriteria(Map<String, Object> criteria) {
        return 0;
    }

    @Override
    public int deleteByModelCriteria(RoleInfoModelCriteria criteria) {
        return modelMapper.deleteByExample(criteria);
    }
}
