package com.jdc.online.balances.model;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;

public class BaseRepositoryImpl<T, ID> extends SimpleJpaRepository<T, ID> implements BaseRepository<T, ID> {

	private EntityManager em;

	public BaseRepositoryImpl(Class<T> domainClass, EntityManager entityManager) {
		super(domainClass, entityManager);
		this.em = entityManager;
	}

	@Override
	public <R> List<R> search(Function<CriteriaBuilder, CriteriaQuery<R>> queryFunc) {
		var criteriaQuery = queryFunc.apply(em.getCriteriaBuilder());
		var jpaQuery = em.createQuery(criteriaQuery);
		return jpaQuery.getResultList();
	}

	@Override
	public <R> PageResult<R> search(Function<CriteriaBuilder, CriteriaQuery<R>> queryFunc,
			Function<CriteriaBuilder, CriteriaQuery<Long>> countFunc, int page, int size) {

		var count = count(countFunc);
		var criteriaQuery = queryFunc.apply(em.getCriteriaBuilder());
		var jpaQuery = em.createQuery(criteriaQuery);
		jpaQuery.setMaxResults(size);
		jpaQuery.setFirstResult(size * page);
		var list = jpaQuery.getResultList();

		return PageResult.<R>builder().contents(list).count(count).size(size).page(page).build();
	}

	@Override
	public <R> Optional<R> serachOne(Function<CriteriaBuilder, CriteriaQuery<R>> queryFunc) {
		var criteriaQuery = queryFunc.apply(em.getCriteriaBuilder());
		var jpaQuery = em.createQuery(criteriaQuery);
		return jpaQuery.getResultStream().findAny();
	}

	@Override
	public Long count(Function<CriteriaBuilder, CriteriaQuery<Long>> countFunc) {
		var criteriaQuery = countFunc.apply(em.getCriteriaBuilder());
		var jpaQuery = em.createQuery(criteriaQuery);
		return jpaQuery.getSingleResult();
	}

}
