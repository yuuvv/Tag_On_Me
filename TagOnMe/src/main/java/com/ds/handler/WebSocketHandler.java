package com.ds.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class WebSocketHandler extends TextWebSocketHandler {

	// ������ ������ ��� �� ��
	// HashMap<String, WebSocketSession> sessionMap = new HashMap<>();

	/* 각각의 방으로 웹소켓을 처리할 때
     * 웹소켓 세션을 담아둘 리스트 ---roomListSessions */
	List<HashMap<String, Object>> rls = new ArrayList<>(); // roomListSessions
	
	private static JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 클라이언트로부터 메시지 도착하면
		String msg = message.getPayload();
		JSONObject obj = JsonToObjectParser(msg);

		String rN = (String) obj.get("roomNumber");
		
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if (rls.size() > 0) {
			for (int i = 0; i < rls.size(); i++) {
				String roomNumber = (String) rls.get(i).get("roomNumber"); // 세션리스트의 저장된 방번호를 가져와서
				if (roomNumber.equals(rN)) { // 같은값의 방이 존재한다면
					temp = rls.get(i); // 해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
					break;
				}
			}

			// 해당 방의 세션들만 찾아서 메시지를 발송해준다.
			for (String k : temp.keySet()) {
				if (k.equals("roomNumber")) { // 다만 방번호일 경우에는 건너뛴다.
					continue;
				}

				WebSocketSession wss = (WebSocketSession) temp.get(k);
				if (wss != null) {
					try {
						wss.sendMessage(new TextMessage(obj.toJSONString()));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	@SuppressWarnings("nuchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 소켓 연결
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		System.out.println(url);
		String roomNumber = url.split("/chatting/")[1];
		int idx = rls.size(); // 방의 사이즈를 조사한다.
		if (rls.size() > 0) {
			for (int i = 0; i < rls.size(); i++) {
				String rN = (String) rls.get(i).get("roomNumber");
				if (rN.equals(roomNumber)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}

		if (flag) { // 존재하는 방이라면 세션만 추가한다.
			HashMap<String, Object> map = rls.get(idx);
			map.put(session.getId(), session);
		} else { // 최초 생성하는 방이라면 방번호와 세션을 추가한다.
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNumber", roomNumber);
			map.put(session.getId(), session);
			rls.add(map);
		}

		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 클라이언트와 연결 종료시
		if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			for (int i = 0; i < rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}



}
