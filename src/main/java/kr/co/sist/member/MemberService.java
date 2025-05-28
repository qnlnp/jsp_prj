package kr.co.sist.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;

/**
 * 
 */
public class MemberService {
	
	public boolean searchId(String id) {
		boolean flag=false;
		MemberDAO mDAO=MemberDAO.getInstance();
		
		try {
			flag=mDAO.selectId(id);
		} catch (SQLException se) { 
			se.printStackTrace();
		}//end catch
		
		return flag;
	}//searchId
	
	public boolean addMemeber(MemberDTO mDTO) {
		boolean flag=false;
		mDTO.setUseEmail( mDTO.getEmail()+"@"+mDTO.getDomain() );
		
		//정보의 중요도에 따라,,,
		//일방향 해시 : 비밀번호 (알아낼 수 없다~)
		//암호화 : 이름, 이메일(useEmail), 전화번호 (키로,,, 복호화 가능)
		try {
			
			
			
			//일방향 해시 : 비밀번호
			mDTO.setPass(DataEncrypt.messageDigest("SHA-256", mDTO.getPass()));
			//암호화 - > 키가 필요하다~~!
			String key="abcdef0123456789";//키 관리 잘해야 한다~~!
			DataEncrypt de = new DataEncrypt(key);
			mDTO.setName(de.encryption(mDTO.getName()));
			mDTO.setUseEmail(de.encryption(mDTO.getUseEmail()));
			mDTO.setTel(de.encryption(mDTO.getTel()));
			
			
			
		} catch (NoSuchAlgorithmException nsae) {
			nsae.printStackTrace();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch
		
		MemberDAO mDAO=MemberDAO.getInstance();
		
		try {
			mDAO.insertMember(mDTO);
			flag=true;
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch

		return flag;
	}//addMemeber
	
	
	
	/**
	 * @param id
	 * @return
	 */
	public MemberDTO searchOneMember(String id) {
		MemberDTO mDTO = null;
		MemberDAO mDAO = MemberDAO.getInstance();
		
		try {
			mDTO = mDAO.selectOneMember(id);
			
			String key="abcdef0123456789";//키 관리 잘해야 한다~~!
			DataDecrypt dd = new DataDecrypt(key);
			
			try {
				mDTO.setName(dd.decryption(mDTO.getName()));
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
		
			try {
				mDTO.setTel(dd.decryption(mDTO.getTel()));
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
			
			mDTO.setProfile(mDTO.getProfile());
			
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return mDTO;
	}//searchOneMember
	
	
	
	
	
	public List<MemberDTO> searchAllMember( String role ){ //이 부분에서,,, role이 적용~~~
		List<MemberDTO> list= null;
		
		MemberDAO mDAO = MemberDAO.getInstance();
		
		try {
			list=mDAO.selectAllMember();
			/* */
			
			
			if( "b".equals(role)|| "c".equals(role) ) {
				//복호화 : 암호화된 데이터(Cipher Text)를 일반문자(Plain Text)로
				//대칭키 : 암호화에사용된 키와 동일한키를 복호화에 사용
				String key="abcdef0123456789";
				DataDecrypt dd = new DataDecrypt(key);
				
				for(MemberDTO mDTO : list) {
					
					try {
						mDTO.setName(dd.decryption(mDTO.getName()));
					} catch (Exception e) {
						e.printStackTrace();
					}//end catch
					
					try {
						mDTO.setUseEmail(dd.decryption(mDTO.getUseEmail()));
					} catch (Exception e) {
						e.printStackTrace();
					}//end catch
					
					if("c".equals(role)) {
						try {
							mDTO.setTel(dd.decryption(mDTO.getTel()));
						} catch (Exception e) {
							e.printStackTrace();
						}//end catch
					}//end if
					
				}//end for
			}//end if
			
		} catch (SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllMember
	
	 
}//class
