package com.snwd.dao.ibatis;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.security.userdetails.UserDetails;
import org.springframework.security.userdetails.UserDetailsService;
import org.springframework.security.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.snwd.dao.UserDao;
import com.snwd.model.Role;
import com.snwd.model.User;
@Repository("userDao")
public class UserDaoiBatis extends GenericDaoiBatis<User, Long> implements
		UserDao, UserDetailsService {
	public UserDaoiBatis() {
		super(User.class);
	}

	public User get(Long userId) {
		User user = (User) getSqlMapClientTemplate().queryForObject("getUser",
				userId);

		if (user == null) {
			this.logger.warn("uh oh, user not found...");
			throw new ObjectRetrievalFailureException(User.class, userId);
		}
		List roles = getSqlMapClientTemplate().queryForList("getUserRoles",
				user);
		user.setRoles(new HashSet(roles));

		return user;
	}

	public List<User> getUsers() {
		List users = getSqlMapClientTemplate().queryForList("getUsers", null);

		for (int i = 0; i < users.size(); i++) {
			User user = (User) users.get(i);

			List roles = getSqlMapClientTemplate().queryForList("getUserRoles",
					user);
			user.setRoles(new HashSet(roles));
			users.set(i, user);
		}

		return users;
	}

	private void deleteUserRoles(Long userId) {
		getSqlMapClientTemplate().update("deleteUserRoles", userId);
	}

	private void addUserRoles(User user) {
		if (user.getRoles() != null)
			for (Role role : user.getRoles()) {
				Map newRole = new HashMap();
				newRole.put("userId", user.getId());
				newRole.put("roleId", role.getId());

				List userRoles = getSqlMapClientTemplate().queryForList(
						"getUserRoles", user);
				if (userRoles.isEmpty())
					getSqlMapClientTemplate().update("addUserRole", newRole);
			}
	}

	public User saveUser(User user) {
		iBatisDaoUtils.prepareObjectForSaveOrUpdate(user);

		if (user.getId() == null) {
			Long id = (Long) getSqlMapClientTemplate().insert("addUser", user);
			user.setId(id);
			addUserRoles(user);
		} else {
			getSqlMapClientTemplate().update("updateUser", user);
			deleteUserRoles(user.getId());
			addUserRoles(user);
		}
		return user;
	}

	public void remove(Long userId) {
		deleteUserRoles(userId);
		getSqlMapClientTemplate().update("deleteUser", userId);
	}

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		User user = (User) getSqlMapClientTemplate().queryForObject(
				"getUserByUsername", username);

		if (user == null) {
			this.logger.warn("uh oh, user not found...");
			throw new UsernameNotFoundException("user '" + username
					+ "' not found...");
		}
		List roles = getSqlMapClientTemplate().queryForList("getUserRoles",
				user);
		user.setRoles(new HashSet(roles));

		return user;
	}

	public String getUserPassword(String username) {
		return (String) getSqlMapClientTemplate().queryForObject(
				"getUserPassword", username);
	}
	@Override
	public User getUserObject(String username) {
		return (User) getSqlMapClientTemplate().queryForObject("getUserByUsername", username);
	}

	@Override
	public User getUserObject1(String email) {
		return (User) getSqlMapClientTemplate().queryForObject("getUserByEmail",email);
	}
}
