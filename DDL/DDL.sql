

DROP TABLE IF EXISTS `follow_user`;

CREATE TABLE `follow_user` (
	`follow_id`	INT	NOT NULL,
	`follower_id`	INT	NOT NULL	COMMENT '팔로우한 사람 ID',
	`followed_user_id`	INT	NOT NULL	COMMENT '팔로우 당한 사람 ID',
	`followed_at`	DATETIME	NOT NULL	DEFAULT CURDATE()	COMMENT '팔로우 한 시각'
	,UNIQUE(follower_id, followed_user_id)
	,CHECK (follower_id != followed_user_id)
);

DROP TABLE IF EXISTS `bookmark`;

CREATE TABLE `bookmark` (
	`post_id`	INT	NOT NULL	COMMENT '게시글 ID',
	`user_id`	INT	NOT NULL	COMMENT '사용자 ID',
	`bookmarked_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '북마크한 시간'
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`review_post_id`	INT	NOT NULL	COMMENT '리뷰게시글 ID',
	`event_record_id`	INT	NOT NULL	COMMENT '관람내역 ID',
	`rating`	INT	NOT NULL	COMMENT '리뷰 별점',
	UNIQUE (`review_post_id`, `event_record_id`)
	,CHECK (rating BETWEEN 1 AND 5)
);

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
	`event_id`	INT	NOT NULL,
	`type_id`	INT	NOT NULL	COMMENT '분야ID',
	`title`	VARCHAR(50)	NOT NULL	COMMENT '제목',
	`location`	VARCHAR(255)	NOT NULL	COMMENT '장소',
	`event_start_date`	DATE	NOT NULL	COMMENT '시작일자',
	`event_finish_date`	DATE	NOT NULL	COMMENT '종료일자',
	`running_time`	VARCHAR(50)	NOT NULL	COMMENT '관람시간',
	`age_limit`	INT	NOT NULL	COMMENT '관람연령',
	`price`	INT	NOT NULL	COMMENT '가격',
	`description`	TEXT	NULL	COMMENT '상세설명',
	`poster_image_url`	VARCHAR(2048)	NULL	COMMENT '포스터 이미지 URL',
	`event_status`	ENUM('BEFORE', 'RUNNING', 'AFTER')	NOT NULL	COMMENT '공연상태',
	`sales_status`	BOOLEAN	NOT NULL	COMMENT '판매상태',
	`sales_start_date`	DATETIME	NOT NULL	COMMENT '판매시작일자',
	`sales_finish_date`	DATETIME	NOT NULL	COMMENT '판매종료일자',
	`review_count`	INT	NOT NULL	DEFAULT 0	COMMENT '총 리뷰 수',
	`review_rating_sum`	DECIMAL(10,1)	NOT NULL	DEFAULT 0	COMMENT '총 별점 합'
	,CHECK (event_finish_date >= event_start_date)
	,CHECK (sales_finish_date >= sales_start_date)
);

DROP TABLE IF EXISTS `field`;

CREATE TABLE `field` (
	`field_id`	INT	NOT NULL,
	`field_name`	VARCHAR(50)	NOT NULL	COMMENT '분류이름'
);

DROP TABLE IF EXISTS `noticeboard`;

CREATE TABLE `noticeboard` (
	`notice_id`	INT	NOT NULL,
	`admin_id`	INT	NOT NULL	COMMENT '관리자ID',
	`notice_title`	VARCHAR(50)	NOT NULL	COMMENT '공지사항 제목',
	`notice_content`	VARCHAR(255)	NOT NULL	COMMENT '공지사항 내용',
	`notice_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '공지사항 작성시각',
	`notice_modify_at`	DATETIME	NULL	COMMENT '공지사항 수정시각',
	`pinned`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '상단고정',
	`is_notice_deleted`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '공지사항 삭제 여부'
);

DROP TABLE IF EXISTS `report_check`;

CREATE TABLE `report_check` (
	`report_check_id`	INT	NOT NULL,
	`post_id`	INT	NULL	COMMENT '게시글ID',
	`comment_id`	INT	NULL	COMMENT '댓글 ID',
	`is_checked`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '검토 상태',
	`report_type`	ENUM('post', 'comment')	NOT NULL
);

DROP TABLE IF EXISTS `block_user`;

CREATE TABLE `block_user` (
	`block_id`	INT	NOT NULL,
	`blocker_id`	INT	NOT NULL	COMMENT '차단한 사람 ID',
	`blocked_user_id`	INT	NOT NULL	COMMENT '차단 당한 사람 ID',
	`blocked_at`	DATETIME	NOT NULL	DEFAULT CURDATE()	COMMENT '차단 시각'
	,UNIQUE(blocker_id, blocked_user_id)
	,CHECK (blocker_id != blocked_user_id)
);

DROP TABLE IF EXISTS `show_cast`;

CREATE TABLE `show_cast` (
	`show_id`	INT	NOT NULL	COMMENT '공연ID',
	`artist_id`	INT	NOT NULL	COMMENT '아티스트ID',
	`cast`	VARCHAR(50)	NULL	COMMENT '배역'
);

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
	`like_id`	INT	NOT NULL,
	`user_id`	INT	NOT NULL	COMMENT '사용자ID',
	`post_id`	INT	NULL	COMMENT '게시글ID',
	`comment_id`	INT	NULL	COMMENT '댓글 ID',
	`writing_type`	ENUM('post', 'comment')	NOT NULL	COMMENT '글 타입',
	`liked_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '추천 시각'
);

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`comment_id`	INT	NOT NULL,
	`user_id`	INT	NOT NULL	COMMENT '사용자 ID',
	`post_id`	INT	NOT NULL	COMMENT '게시글 ID',
	`parent_id`	INT	NULL	COMMENT '부모 댓글 ID',
	`content`	VARCHAR(1000)	NOT NULL	COMMENT '내용',
	`created_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '작성시각',
	`updated_at`	DATETIME	NULL	COMMENT '수정시각',
	`is_comment_deleted`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '댓글 삭제 여부'
);

DROP TABLE IF EXISTS `post_category`;

CREATE TABLE `post_category` (
	`category_id`	INT	NOT NULL,
	`category_name`	VARCHAR(50)	NOT NULL	COMMENT '카테고리명'
);

DROP TABLE IF EXISTS `user_interest`;

CREATE TABLE `user_interest` (
	`user_id`	INT	NOT NULL	COMMENT '사용자 ID',
	`field_id`	INT	NOT NULL	COMMENT '분류 ID'
);

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
	`admin_id`	INT	NOT NULL,
	`admin_name`	VARCHAR(50)	NOT NULL	COMMENT '관리자 이름',
	`admin_password`	VARCHAR(255)	NOT NULL	COMMENT '비밀번호'
);

DROP TABLE IF EXISTS `banned_user`;

CREATE TABLE `banned_user` (
	`ban_id`	INT	NOT NULL,
	`banned_user_id`	INT	NOT NULL UNIQUE	COMMENT '정지된 사용자',
	`assigned_admin_id`	INT	NULL	COMMENT '정지 담당 관리자 ID',
	`ban_reason`	VARCHAR(255)	NOT NULL	COMMENT '정지 사유',
	`banned_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '정지 시각'
);

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
	`event_id`	INT	NOT NULL	COMMENT '공연/전시ID',
	`reserve_service_id`	INT	NOT NULL	COMMENT '예매처ID',
	`reserve_service_link`	VARCHAR(2048)	NOT NULL	COMMENT '예매처별 링크'
);

DROP TABLE IF EXISTS `reserve_service`;

CREATE TABLE `reserve_service` (
	`reserve_service_id`	INT	NOT NULL,
	`reserve_service_name`	VARCHAR(50)	NOT NULL	COMMENT '예매처 이름'
);

DROP TABLE IF EXISTS `report_reason`;

CREATE TABLE `report_reason` (
	`report_reason_id`	INT	NOT NULL,
	`report_reason`	VARCHAR(50)	NOT NULL	COMMENT '신고 사유'
);

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`user_id`	INT	NOT NULL,
	`login_id`	VARCHAR(30)	NOT NULL UNIQUE	COMMENT '로그인 ID',
	`password`	VARCHAR(255)	NOT NULL	COMMENT '비밀번호',
	`user_name`	VARCHAR(30)	NOT NULL	COMMENT '사용자이름',
	`phone_number`	VARCHAR(30)	NOT NULL UNIQUE	COMMENT '전화번호',
	`email`	VARCHAR(255)	NOT NULL UNIQUE	COMMENT '이메일',
	`nickname`	VARCHAR(50)	NOT NULL UNIQUE	COMMENT '닉네임',
	`gender`	ENUM('M', 'F')	NOT NULL	COMMENT '성별',
	`register_date`	DATETIME	NOT NULL	DEFAULT CURDATE()	COMMENT '가입일자',
	`profile_image_url`	VARCHAR(2048)	NULL	COMMENT '프로필 이미지',
	`is_user_deleted`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '사용자 삭제 여부',
	`privacy_option`	ENUM('PRIVATE', 'FOLLOWER', 'PUBLIC')	NOT NULL	DEFAULT 'PUBLIC'	COMMENT '관람내역 목록 공개 범위'
);

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
	`post_id`	INT	NOT NULL,
	`category_id`	INT	NOT NULL	COMMENT '카테고리ID',
	`user_id`	INT	NOT NULL	COMMENT '사용자ID',
	`post_title`	VARCHAR(255)	NOT NULL	COMMENT '게시글 제목',
	`post_content`	TEXT	NOT NULL	COMMENT '게시글 내용',
	`created_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '작성시각',
	`updated_at`	DATETIME	NULL	COMMENT '수정시각',
	`is_post_deleted`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '게시글 삭제 여부'
);

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
	`attachment_id`	INT	NOT NULL,
	`notice_id`	INT	NULL	COMMENT '공지사항ID',
	`post_Id`	INT	NULL	COMMENT '게시글 ID',
	`post_type`	ENUM('post',  'notice')	NOT NULL	COMMENT '게시글 타입',
	`file_url`	VARCHAR(2048)	NOT NULL	COMMENT '파일 URL'
);

DROP TABLE IF EXISTS `event_record`;

CREATE TABLE `event_record` (
	`event_record_id`	INT	NOT NULL,
	`event_id`	INT	NOT NULL	COMMENT '공연/전시 ID',
	`user_id`	INT	NOT NULL	COMMENT '사용자 ID',
	`admin_id`	INT	NULL	COMMENT '관리자 ID',
	`record_date`	DATE	NOT NULL	COMMENT '관람일자',
	`ticket_image_url`	VARCHAR(2048)	NOT NULL	COMMENT '티켓 이미지 URL',
	`ticket_num`	INT	NULL	COMMENT '티켓일련번호',
	`is_ticket_verified`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '티켓인증여부',
	`admin_check_status`	BOOLEAN	NOT NULL	DEFAULT 0	COMMENT '관리자 검토 상태',
	`authentication_date`	DATE	NULL	COMMENT '인증날짜',
	`is_hidden`	BOOLEAN	NULL	DEFAULT 0	COMMENT '관람내역 숨김 여부'
	,UNIQUE(event_id, user_id)
);

DROP TABLE IF EXISTS `favorite`;

CREATE TABLE `favorite` (
	`event_id`	INT	NOT NULL	COMMENT '공연/전시ID',
	`user_id`	INT	NOT NULL	COMMENT '사용자ID',
	`added_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '찜한 시각'
);

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist` (
	`artist_id`	INT	NOT NULL,
	`artist_name`	VARCHAR(30)	NOT NULL	COMMENT '아티스트 이름',
	`artist_job`	VARCHAR(30)	NOT NULL	COMMENT '아티스트 직업',
	`artist_age`	INT	NOT NULL	COMMENT '아티스트 나이',
	`artist_gender`	ENUM('M', 'F')	NOT NULL	COMMENT '아티스트 성별',
	`profile_image_url`	VARCHAR(2048)	NULL	COMMENT '프로필 이미지 URL'
);

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
	`report_id`	INT	NOT NULL,
	`post_id`	INT	NULL	COMMENT '게시글 ID',
	`comment_id`	INT	NULL	COMMENT '댓글 ID',
	`report_reason_id`	INT	NOT NULL	COMMENT '신고 이유',
	`reporter_id`	INT	NOT NULL	COMMENT '신고자 ID',
	`reported_at`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '신고 시각',
	`other_report_reason`	VARCHAR(255)	NULL	COMMENT '기타 신고 사유'
);

ALTER TABLE `follow_user`
MODIFY COLUMN follow_id INT NOT NULL AUTO_INCREMENT COMMENT '팔로우 관계 ID',
ADD CONSTRAINT `PK_FOLLOW_USER` PRIMARY KEY (
	`follow_id`
);

ALTER TABLE `bookmark` ADD CONSTRAINT `PK_BOOKMARK` PRIMARY KEY (
	`post_id`,
	`user_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_post_id`
);

ALTER TABLE `event`
MODIFY COLUMN event_id INT NOT NULL AUTO_INCREMENT	COMMENT '공연/전시ID',
ADD CONSTRAINT `PK_EVENT` PRIMARY KEY (
	`event_id`
);

ALTER TABLE `field`
MODIFY COLUMN field_id INT NOT NULL AUTO_INCREMENT	COMMENT '분류 ID',
ADD CONSTRAINT `PK_FIELD` PRIMARY KEY (
	`field_id`
);

ALTER TABLE `noticeboard`
MODIFY COLUMN notice_id INT NOT NULL AUTO_INCREMENT COMMENT '공지사항 ID',
ADD CONSTRAINT `PK_NOTICEBOARD` PRIMARY KEY (
	`notice_id`
);

ALTER TABLE `report_check`
MODIFY COLUMN report_check_id INT NOT NULL AUTO_INCREMENT COMMENT '검토 ID',
ADD CONSTRAINT `PK_REPORT_CHECK` PRIMARY KEY (
	`report_check_id`
);

ALTER TABLE `block_user`
MODIFY COLUMN block_id INT NOT NULL AUTO_INCREMENT	COMMENT '차단 관계 ID',
ADD CONSTRAINT `PK_BLOCK_USER` PRIMARY KEY (
	`block_id`
);

ALTER TABLE `show_cast` ADD CONSTRAINT `PK_SHOW_CAST` PRIMARY KEY (
	`show_id`,
	`artist_id`
);

ALTER TABLE `like`
MODIFY COLUMN like_id INT NOT NULL AUTO_INCREMENT COMMENT '추천 ID',
ADD CONSTRAINT `PK_LIKE` PRIMARY KEY (
	`like_id`
);

ALTER TABLE `comment`
MODIFY COLUMN comment_id INT NOT NULL AUTO_INCREMENT COMMENT '댓글 ID',
ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`comment_id`
);

ALTER TABLE `post_category`
MODIFY COLUMN category_id INT NOT NULL AUTO_INCREMENT	COMMENT '카테고리ID',
ADD CONSTRAINT `PK_POST_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `user_interest` ADD CONSTRAINT `PK_USER_INTEREST` PRIMARY KEY (
	`user_id`,
	`field_id`
);

ALTER TABLE `admin` 
MODIFY COLUMN admin_id INT NOT NULL AUTO_INCREMENT	COMMENT '관리자 ID',
ADD CONSTRAINT `PK_ADMIN` PRIMARY KEY (
	`admin_id`
);

ALTER TABLE `banned_user` 
MODIFY COLUMN ban_id INT NOT NULL AUTO_INCREMENT COMMENT '정지ID',
ADD CONSTRAINT `PK_BANNED_USER` PRIMARY KEY (
	`ban_id`
);

ALTER TABLE `reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`event_id`,
	`reserve_service_id`
);

ALTER TABLE `reserve_service`
MODIFY COLUMN reserve_service_id INT NOT NULL AUTO_INCREMENT COMMENT '예매처 ID',
ADD CONSTRAINT `PK_RESERVE_SERVICE` PRIMARY KEY (
	`reserve_service_id`
);

ALTER TABLE `report_reason` 
MODIFY COLUMN report_reason_id INT NOT NULL AUTO_INCREMENT COMMENT '신고 사유 ID',
ADD CONSTRAINT `PK_REPORT_REASON` PRIMARY KEY (
	`report_reason_id`
);

ALTER TABLE `user` 
MODIFY COLUMN user_id INT NOT NULL AUTO_INCREMENT COMMENT '사용자ID',
ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `post` 
MODIFY COLUMN post_id INT NOT NULL AUTO_INCREMENT COMMENT '게시글ID',
ADD CONSTRAINT `PK_POST` PRIMARY KEY (
	`post_id`
);

ALTER TABLE `attachment` 
MODIFY COLUMN attachment_id INT NOT NULL AUTO_INCREMENT COMMENT '첨부파일ID',
ADD CONSTRAINT `PK_ATTACHMENT` PRIMARY KEY (
	`attachment_id`
);

ALTER TABLE `event_record` 
MODIFY COLUMN event_record_id INT NOT NULL AUTO_INCREMENT COMMENT '관람내역 ID',
ADD CONSTRAINT `PK_EVENT_RECORD` PRIMARY KEY (
	`event_record_id`
);

ALTER TABLE `favorite` ADD CONSTRAINT `PK_FAVORITE` PRIMARY KEY (
	`event_id`,
	`user_id`
);

ALTER TABLE `artist` 
MODIFY COLUMN artist_id INT NOT NULL AUTO_INCREMENT COMMENT '아티스트 ID',
ADD CONSTRAINT `PK_ARTIST` PRIMARY KEY (
	`artist_id`
);

ALTER TABLE `report` 
MODIFY COLUMN report_id INT NOT NULL AUTO_INCREMENT COMMENT '신고 ID',
ADD CONSTRAINT `PK_REPORT` PRIMARY KEY (
	`report_id`
);

ALTER TABLE `follow_user` ADD CONSTRAINT `FK_user_TO_follow_user_1` FOREIGN KEY (
	`follower_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `follow_user` ADD CONSTRAINT `FK_user_TO_follow_user_2` FOREIGN KEY (
	`followed_user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `bookmark` ADD CONSTRAINT `FK_post_TO_bookmark_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `bookmark` ADD CONSTRAINT `FK_user_TO_bookmark_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_post_TO_review_1` FOREIGN KEY (
	`review_post_id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_event_record_TO_review_1` FOREIGN KEY (
	`event_record_id`
)
REFERENCES `event_record` (
	`event_record_id`
) ON DELETE CASCADE;

ALTER TABLE `event` ADD CONSTRAINT `FK_field_TO_event_1` FOREIGN KEY (
	`type_id`
)
REFERENCES `field` (
	`field_id`
);

ALTER TABLE `noticeboard` ADD CONSTRAINT `FK_admin_TO_noticeboard_1` FOREIGN KEY (
	`admin_id`
)
REFERENCES `admin` (
	`admin_id`
);

ALTER TABLE `report_check` ADD CONSTRAINT `FK_post_TO_report_check_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `report_check` ADD CONSTRAINT `FK_comment_TO_report_check_1` FOREIGN KEY (
	`comment_id`
)
REFERENCES `comment` (
	`comment_id`
);

ALTER TABLE `block_user` ADD CONSTRAINT `FK_user_TO_block_user_1` FOREIGN KEY (
	`blocker_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `block_user` ADD CONSTRAINT `FK_user_TO_block_user_2` FOREIGN KEY (
	`blocked_user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `show_cast` ADD CONSTRAINT `FK_event_TO_show_cast_1` FOREIGN KEY (
	`show_id`
)
REFERENCES `event` (
	`event_id`
);

ALTER TABLE `show_cast` ADD CONSTRAINT `FK_artist_TO_show_cast_1` FOREIGN KEY (
	`artist_id`
)
REFERENCES `artist` (
	`artist_id`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_user_TO_like_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_post_TO_like_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_comment_TO_like_1` FOREIGN KEY (
	`comment_id`
)
REFERENCES `comment` (
	`comment_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_user_TO_comment_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_comment_TO_comment_1` FOREIGN KEY (
	`parent_id`
)
REFERENCES `comment` (
	`comment_id`
);

ALTER TABLE `user_interest` ADD CONSTRAINT `FK_user_TO_user_interest_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `user_interest` ADD CONSTRAINT `FK_field_TO_user_interest_1` FOREIGN KEY (
	`field_id`
)
REFERENCES `field` (
	`field_id`
) ON DELETE CASCADE;

ALTER TABLE `banned_user` ADD CONSTRAINT `FK_user_TO_banned_user_1` FOREIGN KEY (
	`banned_user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `banned_user` ADD CONSTRAINT `FK_admin_TO_banned_user_1` FOREIGN KEY (
	`assigned_admin_id`
)
REFERENCES `admin` (
	`admin_id`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_event_TO_reservation_1` FOREIGN KEY (
	`event_id`
)
REFERENCES `event` (
	`event_id`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_reserve_service_TO_reservation_1` FOREIGN KEY (
	`reserve_service_id`
)
REFERENCES `reserve_service` (
	`reserve_service_id`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_post_category_TO_post_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `post_category` (
	`category_id`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_user_TO_post_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `attachment` ADD CONSTRAINT `FK_noticeboard_TO_attachment_1` FOREIGN KEY (
	`notice_id`
)
REFERENCES `noticeboard` (
	`notice_id`
);

ALTER TABLE `attachment` ADD CONSTRAINT `FK_post_TO_attachment_1` FOREIGN KEY (
	`post_Id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `event_record` ADD CONSTRAINT `FK_event_TO_event_record_1` FOREIGN KEY (
	`event_id`
)
REFERENCES `event` (
	`event_id`
);

ALTER TABLE `event_record` ADD CONSTRAINT `FK_user_TO_event_record_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `event_record` ADD CONSTRAINT `FK_admin_TO_event_record_1` FOREIGN KEY (
	`admin_id`
)
REFERENCES `admin` (
	`admin_id`
);

ALTER TABLE `favorite` ADD CONSTRAINT `FK_event_TO_favorite_1` FOREIGN KEY (
	`event_id`
)
REFERENCES `event` (
	`event_id`
);

ALTER TABLE `favorite` ADD CONSTRAINT `FK_user_TO_favorite_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_post_TO_report_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_comment_TO_report_1` FOREIGN KEY (
	`comment_id`
)
REFERENCES `comment` (
	`comment_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_report_reason_TO_report_1` FOREIGN KEY (
	`report_reason_id`
)
REFERENCES `report_reason` (
	`report_reason_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_user_TO_report_1` FOREIGN KEY (
	`reporter_id`
)
REFERENCES `user` (
	`user_id`
);


ALTER TABLE culture_record.admin 
COMMENT='관리자';
ALTER TABLE culture_record.artist 
COMMENT='아티스트';
ALTER TABLE culture_record.attachment 
COMMENT='첨부파일';
ALTER TABLE culture_record.banned_user 
COMMENT='정지 사용자';
ALTER TABLE culture_record.block_user 
COMMENT='차단 관계';
ALTER TABLE culture_record.bookmark 
COMMENT='북마크한 게시물';
ALTER TABLE culture_record.comment 
COMMENT='댓글 정보';
ALTER TABLE culture_record.event 
COMMENT='공연/전시';
ALTER TABLE culture_record.event_record 
COMMENT='관람내역';
ALTER TABLE culture_record.favorite 
COMMENT='찜 목록';
ALTER TABLE culture_record.field 
COMMENT='분류';
ALTER TABLE culture_record.reserve_service 
COMMENT='예매처 리스트';
ALTER TABLE culture_record.reservation 
COMMENT='예매처 별 공연/전시';
ALTER TABLE culture_record.review 
COMMENT='리뷰 게시글';
ALTER TABLE culture_record.show_cast 
COMMENT='공연 별 출연진 목록';
ALTER TABLE culture_record.follow_user 
COMMENT='팔로우 관계';
ALTER TABLE culture_record.user_interest 
COMMENT='관심 분야';
ALTER TABLE culture_record.`user` 
COMMENT='사용자';
ALTER TABLE culture_record.`like` 
COMMENT='추천';
ALTER TABLE culture_record.noticeboard 
COMMENT='공지사항';
ALTER TABLE culture_record.post_category 
COMMENT='게시글 카테고리';
ALTER TABLE culture_record.report_reason 
COMMENT='신고 사유';
ALTER TABLE culture_record.report 
COMMENT='신고';
ALTER TABLE culture_record.report_check 
COMMENT='신고 검토';
ALTER TABLE culture_record.post 
COMMENT='게시글';


